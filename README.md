# Recursos para Arquitectura de Computadoras 2018

## Como clonar este repositorio: 

`git clone git@github.com:aairabella/arqcomp2018.git`

## Como correr una simulación:


```
signal_running() {
  for i in /var/run/tinc.*pid; do
    if [ -f "$i" ]; then
      head -1 $i | while read pid; do
        kill -$1 $pid
      done
    fi
  done
}
```
