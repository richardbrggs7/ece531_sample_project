#include <stdio.h>
#include <curl/curl.h>

#define OK			0
#define INIT_ERR	1
#define REQ_ERR		2

#ifndef ARM
#define URL			"http://localhost:80"
#else
#define URL 		"http://192.168.1.22:80"
#endif

int main(void){
	CURL	*curl;
	CURLcode res;

	curl = curl_easy_init();
	if(curl){
		curl_easy_setopt(curl, CURLOPT_URL, URL);
		curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
		res = curl_easy_perform(curl);
		if(res != CURLE_OK) {
			printf("curl error %i\n", res);
			return REQ_ERR;
		}

		curl_easy_cleanup(curl);
	}

	else {
		printf("curl init error\n");
		return INIT_ERR;
	}

	// printf("%i\n", OK);
	return OK;
}