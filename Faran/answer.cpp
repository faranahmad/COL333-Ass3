#include <iostream> 
#include <string> 
#include <fstream> 
#include <stack>
#include <utility>
#include <vector>
#include <cstdlib>
#include <math.h>
#include <algorithm>

using namespace std;


// Break the string s into substrings wherever the chartosplit appears
vector<string> SplitString(string s, char chartosplit)
{
    vector<string> answer;
    int initlength = s.length();
    string tostore = "";
    int i = 0;
    while(i < initlength)
    {
        if(s[i] == chartosplit)
        {
            answer.push_back(tostore);
            tostore = "";
        }
        else
        {
            tostore = tostore+s[i];
        }
        i++;
    }   
    answer.push_back(tostore); 
    return answer;
}

string getNumber(string s)
{
    string answer="";
    for(int i=4;i<s.size();i++)
        answer = answer + s[i];
    return answer;
}



int main()
{
	vector<string> lines;
    string line;
    // char* filename = argv[1];
    ifstream myfile ( "problem.plan" );
    if ( myfile.is_open ( ) )
    {
        bool soln_exist = false;
        while ( getline ( myfile, line ) )
        {
            if(line == "Solution found!")
            {
                soln_exist = true;
            }
            else if(line == "Completely explored state space -- no solution!")
            {
                cout << -1 << endl;
                exit(0);
            }
            else if(soln_exist == true && line[0] == 'm')
            {
                lines.push_back(line);
            }
        }
        myfile.close ( );
    }
    else
    {
        cout << "Unable to open input file";
        exit ( 0 );
    }
    if(line.size()==0)
    {
        cout << 0 << endl;
        exit(0);
    }
    else
    {
        vector< pair<string,string> > t;
        for(int i = 0;i < line.size();i++)
        {
            vector<string> splitted = SplitString(line[i],' ');
            string r = getNumber(splitted[1]);
            if(splitted[0] == "move_up")
            {
                t.push_back(make_pair(r," U ")); 
            }
            else if(splitted[0] == "move_right")
            {
                t.push_back(make_pair(r," R "));
            }
            else if(splitted[0] == "move_left")
            {
                t.push_back(make_pair(r," L "));
            }
            else
            {
                t.push_back(make_pair(r," D "));
            }
        }
        int k = 0;
        vector<string> answer;
        while(k<t.size())
        {
            int count = 1;
            while(t[k].first == t[k+1].first && k+1 < t.size())
            {
                count++;
                k++;
            }
            string f = t[k].first.append(t[k].second).append(to_string(count));
            answer.push_back(f);

        } 
        cout << answer.size() << endl;
        for(int u = 0;u<answer.size();u++)
        {
            cout << answer[u] << endl;
        }
    }

}
