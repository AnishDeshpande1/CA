#include <bits/stdc++.h>
using namespace std;
void printhex(string num){
	map<string, char> m; 
    m["0000"]='0';m["0001"]='1';m["0010"]='2';m["0011"]='3';m["0100"]='4';
    m["0101"]='5';m["0110"]='6';m["0111"]='7';m["1000"]='8';m["1001"]='9';
    m["1010"]='A';m["1011"]='B';m["1100"]='C';m["1101"]='D';m["1110"]='E';m["1111"]='F';
    string ans="";
	for(int i = 0;i<8;i++){
		string hex = num.substr(4*i,4);
		ans = ans+m[hex];
	}
	cout<<ans<<endl;
}
string pad8(string s){
	while(s.length()<8){
		s = "0"+s;
	}
	return s;
}
string pad23(string s){
	while(s.length()<23){
		s = s+"0";
	}
	return s;
}
int findexp(long long int n){
	int counter = -1;
	while(n){
		n=n/2;
		counter++;
	}
	return counter;
}
string tobinary(int n){
	string ans = "";
	while(n){
		char c = '0'+n%2;
		ans = c+ans;
		n=n/2;
	}
	return ans;
}
void print_internal_rep(float n){
	string pad23(string s);
	string pad8(string s);
	string tobinary(int n);
	if(n==0){
		cout<<"00000000\n";
		return;
	}
	string s = n>0?"0":"1";
	//cout<<"Sign bit:"<<s<<endl;
	n = abs(n);
	long long int num = n;
	//cout<<"Int part:"<<num<<endl;
	double rem = n - num;
	//cout<<"Decimal part:"<<rem<<endl;
	string decimal_part = "";
	string bias_exp;
	int exp;
	if(num>0)
	{
		exp = findexp(num);
		
		exp = exp+127;
		bias_exp = tobinary(exp);
		
		while(rem>int(rem)){
			rem = rem*2;
			if(rem>=1){
				decimal_part+="1";
				rem-=1;
			}
			else{
				decimal_part+="0";
			}
		}
		bias_exp = pad8(bias_exp);
		decimal_part = pad23(decimal_part);

	}
	else
	{
		exp = 127;
		while(rem>int(rem)){
			rem = rem*2;
			if(rem>=1){
				decimal_part+="1";
				rem-=1;
			}
			else{
				decimal_part+="0";
			}
		}
		for(int i = 0; i< decimal_part.length();i++){
			if(decimal_part[i]=='1'){
				exp-=i+1;
				decimal_part = decimal_part.substr(i+1);
				break;
			}
		}
		bias_exp = pad8(tobinary(exp));
		decimal_part = pad23(decimal_part);
	}
	//cout<<"Exponent:"<<exp<<endl;
	//cout<<"Binary bias exp:"<<bias_exp<<endl;
	//cout<<"Decimal string:"<<decimal_part<<endl;
	string complete_num = s + bias_exp + decimal_part;
	//cout<<complete_num<<endl;
	printhex(complete_num);
}
int main(){
	void print_internal_rep(float n);
	float n=0.0;
	string inp = "";
	cout<<"Enter F or LI or SP or SI or Q\n";
	cin>>inp;
	while(true){
		
		
		if(inp=="F"||inp=="f"){
			cin>>n;
			print_internal_rep(n);
		}
		else if(inp=="LI"||inp=="li"){
			/*We want the largest positive integer
			  SIGN BIT = 0
			  EXPONENT = MAX POSSIBLE EXPONENT !=11111111 (THIS IS INFINITY), hence EXPONENT STRING = 11111110
			  SIGNIFICAND BITS = 11111111111111111111111 (AS WE WANT THE HIGHEST POSSIBLE NUMBER, THE EXPONENT IS LARGE ENOUGH TO REMOVE THE DECIMAL AND CONVERT IT TO AN INTEGER)                         .
			  HENCE BINARY STRING CORRESPONDING TO LARGEST +VE INTEGER = 01111111011111111111111111111111*/
			printhex("01111111011111111111111111111111");
		}
		else if(inp=="SI"||inp=="si"){
			/*We want the smallest positive integer whose successor cannot be represented exactly.
			We have a FIXED POINT REPRESENTATION WITH 23 SIGNIFICAND BITS. 
			EXPONENT BIAS = 127.
			MAX EXPONENT REQUIRED FOR MULTIPLYING THE SIGNIFICAND = 23
			THE EXPONENT WHICH IS JUST ABOVE THIS = 127 + 23 + 1 = 151  =  10010111, WE LOSE PRECISION. THIS NUMBER MAY CORRESPOND TO MANY INTEGERS
			SIGN BIT = 0
			DECIMAL PART = 00000000000000000000000 
			01001011100000000000000000000000*/
			printhex("01001011100000000000000000000000");
		}
		else if(inp=="SP"||inp=="sp"){
			/*We want the smallest positive number
			  SIGN BIT = 0
			  EXPONENT = MIN POSSIBLE EXPONENT=00000000 (2^-127)
			  SIGNIFICAND BITS = 00000000000000000000001 
			  HENCE BINARY STRING CORRESPONDING TO SMALLEST +VE NUMBER = 00000000000000000000000000000001*/
			printhex("00000000000000000000000000000001");
		}
		else if(inp=="Q"||inp=="q"){
			break;
		}
		else{
			cout<<"Enter a valid command.\n";
		}
		cin>>inp;
	}
}