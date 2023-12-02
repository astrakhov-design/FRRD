# DPI (Direct Program Interface)

Интерфейс DPI позволяет осуществлять прямые вызовы функций из языка описания аппаратуры и верификации SystemVerilog в язык программирования C и наоборот. Данная конструкция позволяет разработчику легко вызывать функции другого языка программирования из SystemVerilog и экспортировать функции, чтобы их можно было вызывать на других языках программирования.

## Импортирование и экспортирование функций

### Экспортирование функций

#### SystemVerilog

```sv
export "DPI-C" function print_data_sv;  //Не является прототипом функции

//Эта функция может быть вызвана языком C
function void print_data_sv;
    $display("This function printed in SystemVerilog");
endfunction
```

#### C/C++

```cpp
#include "svdpi.h"

//Вызов функции Systemverilog 
extern "C" void print_data_sv();
```

### Импортирование функций

#### SystemVerilog

```sv
//Эта функция вызывается из языка C
import "DPI-C" function void print_data_c();
```

#### C/C++

```cpp
#include "stdio.h"
#include "stdlib.h"

//Реализация импортируемой функции
extern "C" void print_data_c() {
    printf("This function printed in C");
}
```

## Совместимость типов данных между SystemVerilog и C

Для передачи аргументов функции через DPI необходима пара совпадающих типов данных в языках SystemVerilog и C/C++. В таблице приведены совместимые типы данных между двумя языками.

|Тип данных SystemVerilog | Тип данных C |
|-------------------------|--------------|  
| `byte` | `char` |
| `int` | `int` |
| `longint` | `long long` |
| `shortint` | `short int` |
| `real` | `double` |
| `shortreal` | `float` |
| `chandle` | `void*` |
| `string` | `char*` |

### Пример переноса аргументов в функциях

#### Systemverilog

```sv
export "DPI-C" task sum_data;

task sum_data(input int a, input int b, output int c);
    c = a + b;
endtask
```

#### C/C++

```cpp
//Реализация функции находится в SystemVerilog
//Возвращаемый аргумент передается в виде указателя
extern "C" void sum_data(int a, int b, int * c);
```

## Передача структур через DPI

Интерфейс DPI позволяет передавать структуры с совместимыми типами данных внутри. Для этого необходимо создать структуру с таким же названием в коде SystemVerilog:

#### C/C++

```cpp
typedef struct {
    uint32_t address;
    uint32_t data;
} transaction_s;

extern "C" void load_data(transaction_s * trans);
```

#### SystemVerilog

```sv
typedef struct {
    int unsigned address;
    int unsigned data;
} transaction_s;

export "DPI-C" task load_data;

task load_data(input transaction_s trans);
    //Some code
endtask
```