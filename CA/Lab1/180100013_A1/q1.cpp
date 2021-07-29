#include <bits/stdc++.h>
using namespace std;
string reverse(string s){
	string str = "";
	for(int i = 0; i < s.length(); i++){
		str+=s[s.length()-i-1];
	}
	return str;
}
string pad(string s){
	while(s.length()<8){
		s = '0'+s;
	}
	return s;
}
void print_internal_rep(long long int n){
	int s = n>0?0:1;
	string ans = "";
	map<int, char> m; 
    char digit = '0'; 
    char c = 'A'; 
    for (int i = 0; i <= 15; i++) { 
        if (i < 10) { 
            m[i] = digit++; 
        } 
        else { 
            m[i] = c++; 
        } 
    } 
	if(n==0){
		cout<<"00000000\n";
		return;
	}
	if(n>0){
		while(n){
			ans = ans + m[n%16];
			n = n/16;
		}
		ans = reverse(ans);
		ans = pad(ans);
		cout<<ans<<endl;
	}
	else{
		unsigned num;
		num = n;
		while(num){
			ans = ans + m[num%16];
			num = num/16;
		}
		ans = reverse(ans);
		ans = pad(ans);
		cout<<ans<<endl;
	}
}

int main(){
	void print_internal_rep(long long int n);
	long long int n=0;
	string inp = "";
	cout<<"Enter I or LI or SI or Q\n";
	cin>>inp;
	while(true){
		//cout<<"Hello\n";
		if(inp=="I"||inp=="i"){
			cin>>n;
			print_internal_rep(n);
		}
		else if(inp=="LI"||inp=="li"){
			n = INT_MAX;
			print_internal_rep(n);
		}
		else if(inp=="SI"||inp=="si"){
			n = INT_MIN;
			print_internal_rep(n);
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