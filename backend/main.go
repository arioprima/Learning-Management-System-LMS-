package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	r := gin.Default()
	r.GET("/ping", func(ctx *gin.Context) {
		ctx.IndentedJSON(http.StatusOK, map[string]string{
			"message": "Membuat sistem LMS DENGAN GOLANG DAN REACT",
		})
	})
	err := r.Run()
	if err != nil {
		return
	}
}
