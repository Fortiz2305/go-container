package main

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestHandler(t *testing.T) {
	req, err := http.NewRequest(
		http.MethodGet,
		"http://localhost:8080",
		nil,
	)
	if err != nil {
		t.Fatalf("Something went wrong in the request! %v", err)
	}

	recorder := httptest.NewRecorder()
	handler(recorder, req)

	if recorder.Code != http.StatusOK {
		t.Errorf("Something went wrong. Got status %d", recorder.Code)
	}
	if !strings.Contains(recorder.Body.String(), "Hello, World!") {
		t.Errorf("Unexpected response: %q", recorder.Body.String())
	}
}
