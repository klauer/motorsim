# OSX instructions

* Install [homebrew-epics](https://github.com/klauer/homebrew-epics/).
* Run ``source /usr/local/Cellar/epics-base/3.14.12.5/bin/epics_env.sh``

```
cd motorsim
make
cd iocBoot/ioclocalhost
make
./std.cmd
```

Troubleshooting

* Is conda on your PATH? Its ``gcc`` is not compatible for some reason.
