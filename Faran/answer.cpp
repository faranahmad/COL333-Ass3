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
    ifstream myfile ( "problem2.plan" );
    if ( myfile.is_open ( ) )
    {
        bool soln_exist = false;
        while ( getline ( myfile, line ) )
        {
            if(line == "Solution found!")
            {
                // cout <<"here" << endl;
                soln_exist = true;
            }
            else if(line == "Completely explored state space -- no solution!")
            {
                cout << -1 << endl;
                exit(0);
            }
            else if(soln_exist == true && line[0] == 'm')
            {
                // cout << "in this one" << endl;
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
    if(lines.size()==0)
    {
        // cout << "why"<< endl;
        cout << 0 << endl;
        exit(0);
    }
    else
    {
        // for(int i = 0;i<lines.size();i++)
        // {
        //     cout << lines[i] << endl;
        // }
        vector< pair<string,string> > t;
        for(int i = 0;i < lines.size();i++)
        {
            char x = ' ';
            vector<string> splitted = SplitString(lines[i],x);
            // cout << splitted[0] <<" "<< splitted[1]<<" "<<splitted[2]<<" "<< splitted[3]<<" "<<splitted[4] << endl;
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
        // for(int i = 0;i<t.size();i++)
        // {
        //     cout << t[i].first << " " << t[i].second << endl;
        // }
        int k = 0;
        vector<string> answer;
        while(k<t.size())
        {
            int count = 1;
            if(k+1<t.size())
            {
                while(t[k].first == t[k+1].first)
                {
                    count++;
                    k++;
                    if(k+1==t.size())
                        break;
                }
            }
            string f = t[k].first.append(t[k].second).append(to_string(count));
            answer.push_back(f);
            k+=1;
        } 
        cout << answer.size() << endl;
        for(int u = 0;u<answer.size();u++)
        {
            cout << answer[u] << endl;
        }
    }

}
