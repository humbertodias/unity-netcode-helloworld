[![Build](https://github.com/humbertodias/unity-netcode-helloworld/actions/workflows/main.yml/badge.svg)](https://github.com/humbertodias/unity-netcode-helloworld/actions/workflows/main.yml)

# Netcode "Hello World" Project


### Tested on

* Mac OS Somona
* Unity 2022.3.23f1

### How to run

Server

```sh
curl https://raw.githubusercontent.com/humbertodias/unity-netcode-helloworld/main/run.sh | bash -s server
```

Client

```sh
curl https://raw.githubusercontent.com/humbertodias/unity-netcode-helloworld/main/run.sh | bash -s client 2
```

## Server +2 clients
![](doc/server-2-clients.png)


### Ref

* [NetCode HelloWorld Tutorial](https://docs-multiplayer.unity3d.com/netcode/current/tutorials/helloworld)
* [Unity CommandLineArguments](https://docs.unity.cn/530/Documentation/Manual/CommandLineArguments.html)
* [Unit GHA](https://isaacbroyles.com/gamedev/2020/07/04/unity-github-actions.html)
* [Docker unityci](https://hub.docker.com/r/unityci/editor/tags)
* [Unity platforms](https://docs.unity3d.com/ScriptReference/BuildTarget.html)
