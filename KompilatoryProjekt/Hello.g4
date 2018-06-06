/**
 * Define a grammar called Hello
 */
grammar hello;
r  : Char ;         // match keyword hello followed by an identifier
re  : Char BooleanOperator Char;

Start : Declaration | IfStatement | WhiteSpace | InstructionsBlock;
Declaration : (VariableDec | ArrayDec) Semicolon;
VariableDec : VarType VarName;
ArrayDec : VarType VarName SquareOpenBracket SquareCloseBracket (SquareOpenBracket SquareCloseBracket)*;
ArrayVal : VarName SquareOpenBracket Integer SquareCloseBracket ((SquareOpenBracket Integer SquareCloseBracket)*);
VarType : IntegerType | FloatType | StringType | BooleanType;
IfStatement : If OpenBracket LogicalStatement CloseBraket InstructionsBlock ((Elsif OpenBracket LogicalStatement CloseBraket InstructionsBlock)* Else InstructionsBlock)?;
LogicalStatement: OpenBracket LogicalStatement CloseBraket ((LogicalOperator OpenBracket LogicalStatement CloseBraket)+ | (Value BooleanOperator Value) | Boolean);
Value : (VarName | ArrayVal | Integer | Float | String) (MathOperator (VarName | ArrayVal | Integer | Float | String))*;
Assignment : (VariableDec | ArrayDec | VarName) EqualMark Value Semicolon;
InstructionsBlock : (Declaration | IfStatement | Assignment)*;
Integer : Digit+;
Float : Integer Dot Integer;
String : QuoteMark (Char | Digit)*;
VarName : Char (Char | Digit)*;
Comment: LineComment (Digit | Char | MathOperator | BooleanOperator | SpecialChars | WhiteSpace | Dot | OpenBracket | CloseBraket | SquareOpenBracket | SquareCloseBracket | LineComment)*;
WhiteSpace : ' ';
SpecialChars : '!' | '@' | '#' | '$' | '%' | '^' | '&' | '_' | ',' | '/' |'?';
Digit : [0-9];
Char : [a-z] | [A-Z] ;             // match lower-case identifiers
MathOperator : '+' | '-' | '*' | '/';
BooleanOperator : '<'|'<='|'>'|'>='|'=='|'!=';
LogicalOperator : 'and' | 'or';
Boolean : 'true' 'false';
If : 'if';
Elsif: 'elsif';
Else: 'else';
IntegerType: 'int';
FloatType: 'float';
StringType: 'string';
BooleanType : 'boolean';
EqualMark : '=' ;
Dot : '.';
QuoteMark : '"';
Semicolon :';';
OpenBracket : '(';
CloseBraket : ')';
SquareOpenBracket : '[';
SquareCloseBracket : ']';
LineComment : '//';
NewLine : '\n';

Text : (Char)* ;


WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

