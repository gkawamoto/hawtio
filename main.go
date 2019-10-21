package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	var cmd = exec.Command(
		"java", fmt.Sprintf("-Xms%s", os.Getenv("XMS")), fmt.Sprintf("-Xmx%s", os.Getenv("XMX")),
		"-Dhawtio.proxyWhitelist=*", "-jar", "/app/hawtio.jar",
	)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Stdin = os.Stdin
	var err = cmd.Run()
	if err != nil {
		panic(err)
	}
}
