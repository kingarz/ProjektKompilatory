/**
 * Define a grammar called Hello
 */
 /**
  * Parser Rules
  */
grammar Hello;
/**
 * Lexer Rules
 */
start : declarationList  | ifStatement | instructionsBlock;

declarationList : declaration | declarationList declaration;

declaration : (variableDec | arrayDec) Semicolon;

variableDec : varType VarName;

arrayDec : varType VarName SquareOpenBracket SquareCloseBracket (SquareOpenBracket SquareCloseBracket)*;

arrayVal : VarName SquareOpenBracket Integer SquareCloseBracket ((SquareOpenBracket Integer SquareCloseBracket)*);

varType : IntegerType | FloatType | StringType | BooleanType;

ifStatement : If OpenBracket logicalStatement CloseBracket Then
            OpenBracket instructionsBlock CloseBracket
            ((Elsif OpenBracket logicalStatement CloseBracket instructionsBlock)*
             Else OpenBracket instructionsBlock CloseBracket)?;

logicalStatement:  value BooleanOperator value | Boolean;


value : (VarName | arrayVal | Integer | Float | String) (MathOperator (VarName | arrayVal | Integer | Float | String))*;

assignment : (declaration | VarName) EqualMark value Semicolon;

instructionsBlock : ( declaration | ifStatement | assignment)*;


Integer : Digit+;

Float : Integer Dot Integer;

String : QuoteMark CharSequence QuoteMark;




WhiteSpace : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
SpecialChars : '!' | '@' | '#' | '$' | '%' | '^' | '&' | '_' | ',' | '/' |'?';
fragment Digit : [0-9];
fragment Char : [a-z] ;             // match lower-case identifiers
fragment CharSequence : Char+;



MathOperator : '+' | '-' | '*' | '/';
BooleanOperator : '<'|'<='|'>'|'>='|'=='|'!=';
LogicalOperator : 'and' | 'or';
Boolean : 'true' 'false';
If : 'if';
Elsif: 'elsif';
Else: 'else';
Then: 'then';
IntegerType: 'int';
FloatType: 'float';
StringType: 'string';
BooleanType : 'boolean';
VarName : Char (Char | Digit)*;
EqualMark : '=' ;
Dot : '.';
QuoteMark : '"';
Semicolon :';';
OpenBracket : '(';
CloseBracket : ')';
SquareOpenBracket : '[';
SquareCloseBracket : ']';

Text : (Char)* ;
Whitespace
    :   [ \t]+
        -> skip
    ;

Newline
    :   (   '\r' '\n'?
        |   '\n'
        )
        -> skip
    ;

BlockComment
    :   '/*' .*? '*/'
        -> skip
    ;

LineComment
    :   '//' ~[\r\n]*
        -> skip
    ;


