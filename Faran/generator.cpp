#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>

using namespace std;

int main () 
{
	int M,N;
	cin >> M >> N;
	int gridnumber = M*N;
	int number;
	cin >> number;
	int car_id,posx,posy,hor,length;
	char dir;
	vector< vector<int> > carinfo;
	for(int i=0;i<number;i++)
	{
		cin >> car_id >> length >> posx >> posy >> dir;
		vector<int> info;
		info.push_back(car_id);
		info.push_back(length);
		info.push_back(posx);
		info.push_back(posy);
		if (dir == 'H')
		{
			info.push_back(1);	
		}
		else
		{
			info.push_back(0);
		}
		carinfo.push_back(info);
	}
	int finalx,finaly;
	cin >>finalx>>finaly;
    ofstream myfile ("problem.pddl");
	if (myfile.is_open())
  	{
        myfile << "(define(problem Getout)" << "\n" << "(:domain Far)" << "\n" << "(:objects ";
    	for(int i=1;i<=number;i++)
    	{
    		myfile << "car_" + to_string(i) + " ";
    	}
    	myfile << "-" << " " << "car ";
    	for(int i = 1;i<=gridnumber;i++)
    	{
    		myfile << "grid_" +  to_string(i) + " " ;
    	}
    	myfile << "-" << " " << "grid" << ")" << "\n";
		myfile << "(:init" << "\n";
		vector< pair<int,int> > occupied;
		unordered_map<int,bool> isoccupied;
		vector< pair<int,int> > position;
		vector<int> isfree;
		vector<bool> ishorizontal;  
		for(int i = 0;i<carinfo.size();i++)
		{
			int gridindex = (carinfo[i][3] - 1)*M + carinfo[i][2];
			position.push_back(make_pair(gridindex,carinfo[i][0]));
			if(carinfo[i][4] == 1)
			{
				ishorizontal.push_back(true);
				for(int j = 0;j<carinfo[i][1];j++)
				{
					occupied.push_back(make_pair(gridindex + j,carinfo[i][0]));
					isoccupied[gridindex+j] = true;
				}
			}
			else
			{
				ishorizontal.push_back(false);
				for(int j = 0;j<carinfo[i][1];j++)
				{
					occupied.push_back(make_pair(gridindex + j*M,carinfo[i][0]));
					isoccupied[gridindex + j*M] = true;
				}
			}
		}
		for(int t = 1;t<=gridnumber;t++)
		{
			if(isoccupied[t] != true)
			{
				isfree.push_back(t);
			}
		}
		for(int i = 0;i < position.size();i++)
		{
			myfile << "(position " << "car_" << to_string(position[i].second) << " " << "grid_" << to_string(position[i].first) << ")\n";
		}
		for(int i = 0;i < occupied.size();i++)
		{
			myfile << "(occupied " << "car_" << to_string(occupied[i].second) << " " << "grid_" << to_string(occupied[i].first) << ")\n";	
		} 
		for(int i = 0;i < isfree.size();i++)
		{
			myfile << "(free grid_" << to_string(isfree[i]) << ")\n";
		}
		// myfile.close();
		for(int i = 1;i<=ishorizontal.size();i++)
		{
			if(ishorizontal[i-1])
			{
				myfile << "(horizontal car_" << to_string(i) << ")\n";
			}
			else
			{
				myfile << "(vertical car_" << to_string(i) << ")\n";
			}
		}
		for(int i = M + 1;i<=gridnumber;i++)
		{
			myfile << "(neighbourup grid_" << to_string(i) << " grid_" << to_string(i-M) <<")\n"; 
		}
		for(int i = 2;i<=gridnumber;i++)
		{
			if(i%M != 1)
			{
				myfile << "(neighbourleft grid_" << to_string(i) << " grid_" << to_string(i-1) << ")\n";
			}
		}
		myfile << ")\n(:goal (and";
		int gridinitial = (carinfo[0][3] - 1)*M + carinfo[0][2];
		int gridfinal = (finaly-1)*M + finalx;
		for(int i = 2;i<M;i++)
		{
			if(i == gridfinal || i+(N-1)*M == gridfinal)
			{
				myfile << "(vertical car_1)\n";
				myfile << "(position car_1 " << to_string(gridfinal) << ")";
				myfile << "(not(position car_1" << to_string(gridinitial) << ")"; 
				break;
			}

		}
		for(int i = 1;i <= (N-1)*M + 1;i += M)
		{
			if(i == gridfinal || i + M - 1 == gridfinal)
			{
				myfile << "(horizontal car_1) ";
				myfile << "(position car_1 grid_" << to_string(gridfinal) <<") ";
				myfile << "(not(position car_1 grid_" << to_string(gridinitial) << ")"; 
				break;	
			}
		}
		myfile << "))))";
		myfile.close();
	}	
  	else cout << "Unable to open file";
  	return 0;
	
}
