const hello: string = "world!!";

function add(x:number, y:number): number {
    return x + y;
};

interface Person {
    name: string;
    age: number;
}
const person:Person = {
    name: "홍길동",
    age: 30,
};

// 에러처리여부 - JS - TS
// 문법에러 - o - o
// 타입에러 - x - o
// 런타입에러 - x - x

// Uncaught TypeError: Cannot read property of null
// typeError: null is not an object / undefined is not an object
// ...is not a function
// typeError: Cannot read property 'length'

// const human = {
//     mouth: null,
// };
// human.mouth.sayHello(); // 오류 > human.mouth은 null일 수 있습니다.

const array = [123, 4, 56];
array[3].toFixed();

// string, number, boolean, null, undefined, symbol, bigint, object
const str:string = "hello world";
const num:number = 123;
const bool:boolean = false;
const n:null = null;
const u:undefined = undefined;
const sym:symbol = Symbol('sym');
const big: bigint = 1000000n; // 빨간줄은 버전의 문제
const obj: object = {hello: "world"};

// const obj1: {name: "zero"} = {name: "zero"};
// const arr1: [1, 3, "five"] = [1, 3, "five"];
// const fun: (amount: number, unit: string) => string = (amount, unit) => amount + unit;
const obj1 = {name: "zero"} as const; // 읽기 전용(수정 불가)
const arr = [1, 3, "five"];

const arr1: string[] = ["1", "2", "3"];
const arr2: Array<number> = [1, 2, 3];

const arr3 = [1, 3, 5];
const arr4 = [1, "3", 5];
const arr5 = [];

arr3[3].toFixed(); // arr3[3]은 존재하지 않지만 에러는 안남 > undefined

const data: Date = new Date();
const math: Math = Math;
const str1: String = "hello";
const num1: Number = 123;
const bool1: Boolean = true;
// 대문자도 가능하지만 자료형은 소문자로 쓰도록 하자
// function add(x: Number, y: Number) {
//     return x + y; // 에러 발생(대문자 자료형은 연산이 안됨)
// }
// const str5: String = "hello";
// const str6: string = str5; // 에러 발생

// 유니언 타입 >> | 파이프연산자
let strOrNum: string | number = "rlatnqls"; // string형 number형 둘다 가능
strOrNum = 123;
function returnNumber(value: string | number) {
    if (typeof value === "number") {
        // return parseInt(value); // 에러 발생
        return value.toFixed();
    } else {
        return value.toString();
    }
};
returnNumber(1);
returnNumber("1");


function returnString(value: string | number | boolean): string {
return value.toString();
}
returnString(1);
returnString("1");
returnString(true);

let str11: any = "hello"; // any는 가급적이면 쓰지 말아라
const result = str11.toFixed();

const arr11 = []; // 자료형을 지정하면서 any를 없앤다
arr11.push('1');
arr11; // arr11: string[]
arr11.push(3);
arr11; // arr11: (string | number)[]
const arr12 = [];
arr12[0] = "1";
arr12; // arr12: string[]
arr12[1] = 3;
arr12; // arr12: (string | number)[]

const a: any = "123";
const an1 = a + 1; // any
const nb1 = a - 1; // number
const nb2 = a * 1; // number
const nb3 = a / 1; // number
const st1 = a + "1"; // string

function reReturn() {} // void
const fn: () => void = () => 3;
const fn0 = fn(); // void
const str12: {} = 'hello';
const num11: {} = 123;
const bool11: {} = true;
const obj11: {} = {name: 'zero'};

// never: never 타입 외에 어떤 타입도 대입불가
function neverFn() { // void
    throw new Error("에러");
}
// const result1: never = neverFn(); // 에러 발생: void 형식은 never 형식에 할당할 수 없습니다.
const neverFn2 = () => {
    throw new Error("에러");
}
const result2 = neverFn2(); // result2: never


// 타입에 별칭 붙이기
type A = string; // 별칭(type alias)
const str21: A = "abc"; // str21: string
const fn1: (value: number, unit: string) => string = (value, unit) => value + unit; // 가독성 안좋아서 불편
type valueWithUnit = (value: number, unit: string) => string;
const fn2: valueWithUnit = (value, unit) => value + unit;

const person1: {
    name: string;
    age: number;
    married: boolean;
} = {
    name: "zero",
    age: 30,
    married: false,
};
type PersonType = { // 타입의 별칭은 대문자로 시작하자
    name: string;
    age: number;
    married: boolean;
};
const person2 = {
    name: "abc",
    age: 20,
    married: false,
};

// interface >> 배열이랑 함수도 지정할 수 있다.
interface Person11 {
    name: string;
    age: number;
    married: boolean;
};
const person11: Person11 = {
    name: "abc",
    age: 30,
    married: true,
}
interface Func {
    (x: number, y: number): number;
}
const add11: Func = (x, y) => x + y;
interface Arr {
    length: number;
    [key: number]: string;
}
const arr21: Arr = ["3", "4", "5"];

// type과 interface는 뭐가 다를까?
interface Merge {
    one: string;
}
interface Merge {
    two: number;
} // interface로 중복된 이름을 선언하면 덮어쓰이는 것이 아닌 더해지는 것
const ex: Merge = {
    one: "1",
    two: 2,
};
interface Person12 {
    name: string;
    age: number;
}
interface Employee extends Person12 {
    empId: number;
} // extends를 쓰면서 Person12의 자료형에 추가

// 네임스페이스
namespace Example {
    export interface Inner {
        test: string;
    }
    export type test2 = number;
}
const ex1: Example.Inner = { // 네임스페이스에 내보낸 멤버 'Inner'가 없습니다. >> namespace 안에 export 추가
    test: "hello",
};
const ex2: Example.test2 = 123;

interface Example1 {
    hello: string;
    world?: number; // optional
    readonly wow: boolean; // 읽기 전용
}

const data1: Example1 = {
    hello: "hello",
    world: undefined,
    wow: false,
};