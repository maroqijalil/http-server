#include <sys/stat.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <time.h>
#include <stdbool.h>
#include <microhttpd.h>
#include <unistd.h>

#define PORT 8000
#define GET  0
#define POST 1
#define PAGE_SIZE (64 * 1024)

#define PAGE_NF "<html><head><title>Ga Kenek</title></head><body><h1>Page not Found, or something went wrong!!!</h1></body></html>"
#define ROOT "../../http_server/src/httpd_micro"

struct connection_info_struct
{
  int connectiontype;
  char *answerstring;
  struct MHD_PostProcessor *postprocessor;
};

int *response_num;

static ssize_t
file_reader (void *cls, uint64_t pos, char *buf, size_t max)
{
  FILE *file = cls;

  (void)fseek (file, pos, SEEK_SET);
  return fread (buf, 1, max, file);
}

void
file_writer (const char *filename, int marker,
            int *num1, int *num2)
{
  char file_path[strlen(ROOT) + strlen(filename) + 6];
  char temp_filename[strlen(ROOT) + strlen(filename) + 12];
  char *url = (filename + 1);

  strcpy(temp_filename, ROOT);
  strcat(temp_filename, "/html/temp_");
  strcat(temp_filename, url);

  strcpy(file_path, ROOT);
  strcat(file_path, filename);

  FILE *file = fopen(temp_filename, "rb");
  struct stat f_stat;
  const char *buf_page;
  const char *buf_new_page;

  if (stat(temp_filename, &f_stat))
    return;
  
  buf_page = malloc(sizeof(char) * (f_stat.st_size));

  fseek (file, 0, SEEK_SET);
  fread (buf_page, f_stat.st_size, 1, file);

  if (buf_page != NULL)
  {
    fclose(file);

    file = fopen(file_path, "wb");
    buf_new_page = malloc(sizeof(char) * (strlen(buf_page)));

    if (marker == 1)
      sprintf(buf_new_page, buf_page, num1);
    else
      sprintf(buf_new_page, buf_page, num1, num2);

    if(buf_new_page == NULL)
      return;
  }

  fputs(buf_new_page, file);

  fclose(file);
  free(buf_page);
  free(buf_new_page);
}

static void
free_callback (void *cls)
{
  FILE *file = cls;
  fclose (file);
}

static int
send_page (struct MHD_Connection *connection, const char *filename,
          bool current_page)
{
  struct MHD_Response *response;
  struct stat stat_file;
  FILE *file = NULL;
  int ret;
  int fd;

  if (!current_page)
  {
    const char file_path[strlen(ROOT) + strlen(filename) + 5];
    strcpy(file_path, ROOT);
    strcat(file_path, filename);

    stat (file_path, &stat_file);

    if (strcmp(filename, "/") == 0)
    {
      strcat(file_path, "index.html");

      stat (file_path, &stat_file);
      file = fopen (file_path, "rb");
    }
    else
      file = fopen (file_path, "rb");
    
    if (file == NULL)
    {
      response = MHD_create_response_from_buffer (strlen (PAGE_NF), PAGE_NF,
                                                  MHD_RESPMEM_PERSISTENT);
      ret = MHD_queue_response (connection, MHD_HTTP_NOT_FOUND, response);
      MHD_destroy_response (response);
    }
    else
    {
      response = MHD_create_response_from_callback (stat_file.st_size, PAGE_SIZE,
                                                    &file_reader, file,
                                                    &free_callback);

      if (response == NULL)
      {
        fclose (file);
        return MHD_NO;
      }

      ret = MHD_queue_response (connection, MHD_HTTP_OK, response);
      MHD_destroy_response (response);
    }
  }

  return ret;
}

static int
iterate_post (void *coninfo_cls, enum MHD_ValueKind kind, const char *key,
              const char *filename, const char *content_type,
              const char *transfer_encoding, const char *data, uint64_t off,
              size_t size)
{
  struct connection_info_struct *con_info = coninfo_cls;
  char *answerstring;

  if (0 == strcmp (key, "num1"))
  {
    if (size > 0)
      response_num[0] = atoi(data);

    return MHD_NO;
  }
  else if (0 == strcmp (key, "num2"))
  {
    if (size > 0)
      response_num[1] = atoi(data);

    return MHD_NO;
  }
  else if (0 == strcmp (key, "result"))
  {
    if (size > 0)
    {
      answerstring = malloc(sizeof(char)*(size + 2));
      
      if (!answerstring)
        return MHD_NO;

      sprintf (answerstring, "%s", data);
      con_info->answerstring = answerstring;
    }
    else
      con_info->answerstring = NULL;
    
    return MHD_NO;
  }

  return MHD_YES;
}

static int
create_response (void *cls, struct MHD_Connection *connection,
                const char *url, const char *method,
                const char *version, const char *upload_data,
                size_t *upload_data_size, void **ptr)
{
  char *filename = url;

  printf ("New %s request for %s using version %s\n", method, url, version);

  if (response_num == NULL)
    response_num = malloc (sizeof(int) * 3);

  if (0 != strcmp (method, MHD_HTTP_METHOD_GET) && 
      0 != strcmp (method, MHD_HTTP_METHOD_POST))
    return MHD_NO;
  
  if (strcmp(method, MHD_HTTP_METHOD_GET) == 0)
    return send_page (connection, filename, false);
  
  if (strcmp(method, MHD_HTTP_METHOD_POST) == 0)
  {
    struct connection_info_struct *con_info;

    if (*ptr == NULL)
    {
      con_info = malloc (sizeof(struct connection_info_struct));

      if (NULL == con_info)
        return MHD_NO;
        
      con_info->answerstring = NULL;
      con_info->postprocessor = MHD_create_post_processor (connection, PAGE_SIZE,
                                            &iterate_post, (void*)con_info);

      if (NULL == con_info->postprocessor)
      {
        free (con_info);
        return MHD_NO;
      }

      con_info->connectiontype = POST;

      *ptr = (void*)con_info;

      return MHD_YES;
    }
    else
      con_info = *ptr;

    if (*upload_data_size != 0)
    {
      MHD_post_process (con_info->postprocessor, upload_data,
                        *upload_data_size);
      *upload_data_size = 0;

      return MHD_YES;
    }
    else
    {
      if (strcmp(filename, "/result.html") == 0 && con_info->answerstring != NULL)
      {
        if (strcmp(con_info->answerstring, "Tambah") == 0)
          response_num[2] = response_num[0] + response_num[1];
        else if (strcmp(con_info->answerstring, "Kurang") == 0)
          response_num[2] = response_num[0] - response_num[1];
        
        response_num[0] = response_num[1] = 0;
        
        file_writer(filename, 1, response_num[2], 0);
        
        return send_page (connection, filename, false);
      }
      else if (strcmp(filename, "/takur.html") == 0 && response_num != NULL)
      {
        file_writer(filename, 2, response_num[0], response_num[1]);

        return send_page(connection, filename, false);
      }
    }
  }
}

static void
request_completed (void *cls, struct MHD_Connection *connection,
                   void **con_cls, enum MHD_RequestTerminationCode toe)
{
  struct connection_info_struct *con_info = *con_cls;

  if (NULL == con_info)
    return;

  if (con_info->connectiontype == POST)
    {
      MHD_destroy_post_processor (con_info->postprocessor);
      if (con_info->answerstring)
        free (con_info->answerstring);
    }

  free (con_info);
  *con_cls = NULL;
}

int
main (int argc, char *const *argv)
{
  struct MHD_Daemon *d;

  d = MHD_start_daemon (MHD_USE_THREAD_PER_CONNECTION | MHD_USE_DEBUG
                        | MHD_USE_SELECT_INTERNALLY, PORT,
                        NULL, NULL, &create_response, NULL,
                        MHD_OPTION_NOTIFY_COMPLETED, request_completed,
                        NULL, MHD_OPTION_END);
  if (d == NULL)
    return 1;
  
  getc (stdin);

  MHD_stop_daemon (d);
  return 0;
}
