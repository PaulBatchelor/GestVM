GESTVM=../gestvm
UXNASM=../uxnasm

render () {
    $UXNASM -g $1.tal $1.rom
    $GESTVM $1.lil
}

render sequence
render skew
render weight
