pragma solidity ^0.8.0;

contract Assembly {
    function nativeLoops() public returns (uint _r) {
        for (uint i = 0; i < 10; i++) {
            _r++;
        }
    }

    function asmLoops() public returns (uint_r) {
        assembly {
            let i := 0
        loop:
            i := add(i, 1)
            _r := add(_r, 1)
            jumpi(loop, lt(i, 10))
        }
    }

    function nativeConditional(uint _v) public returns (uint) {
        if (5 == _v) {
            return 55;
        } else if (6 == _v) {
            return 66;
        }
        return 11;
    }

    function asmConditional(uint _v) public return (uint _r){
        assembly {
            switch _v
            case 5 {
                _r := 55
            }
            case 6 {
                _r := 66
            }
            default {
                _r := 11
            }
        }
    }

    // to return in assembly, we need to allocate a pointer to a memory and then return it

    function asmReturns(uint _v) public returns (uint){
        assembly {
            let _ptr := add(mszie(), 1)
            mstore(_ptr, _v)
            // hexadecimal of 32 bytes is 0x20
            return (_ptr, 0x20) // return pointer and denote how much memory to return
        }
    }
}
