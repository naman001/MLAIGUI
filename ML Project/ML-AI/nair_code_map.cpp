#include <iostream>
#include <iomanip>
#include <queue>
#include <string>
#include <math.h>
#include <ctime>
#include <cstdio>
#include <cstdlib>

using namespace std;
const int n=20; // horizontal size of the map
const int m=20; // vertical size size of the map
const int tot=n*m; //number of cells in map
static int seen=0;
static int omap[n][m];
static int cmap[n][m];


static int dir_map[n][m]; // map of directions
const int dir=4; // number of possible directions to go at any position
// if dir==4
static int dx[dir]={1, 0, -1, 0};
static int dy[dir]={0, 1, 0, -1};
static int cost[dir];
static int dist[dir];

// if dir==8
//static int dx[dir]={1, 1, 0, -1, -1, -1, 0, 1};
//static int dy[dir]={0, 1, 1, 1, 0, -1, -1, -1};

static int opp[dir]={2,3,0,1};

int senseL(int x, int y); //to simulate left sensor
int senseR(int x, int y);//to simulate right sensor
int senseT(int x, int y);//to simulate front sensor
int senseD(int x, int y);//to simualte back sensor

void sense(int x,int y);//to sense in all directions

void dispcmap();
void dispomap();
int choosedir(int x,int y);
int movedir(int x,int y,int i);
int reversedir();
int max(int a[dir]);
void dispcmap()
{
     for(int y=0;y<m;y++)
        {
            for(int x=0;x<n;x++)
                if(cmap[x][y]==0)
                    cout<<".";
                else if(cmap[x][y]==1)
                    cout<<"#"; //obstacle
                cout<<endl;
        }
        cout<<endl;
}


void dispomap()
{

     for(int y=0;y<m;y++)
        {
            for(int x=0;x<n;x++)
                /*if(omap[x][y]==0)
                    cout<<".";
                else if(omap[x][y]==1)
                    cout<<"#"; //obstacle
                else if(omap[x][y]==2)
                    cout<<"B"; //bot position
                else if(omap[x][y]==3)
                    cout<<"?"; //undiscovered
                else if(omap[x][y]==4)
                    cout<<"F"; //finish*/
            	cout<<omap[x][y];
            cout<<endl;
        }
        cout<<endl;
}

//left sensor
int senseL(int x,int y)
{
    int d=0;int i;
    for(i=x-1;i>=0;i--)
    {
     // cout<<i<<":c:"<<cmap[i][y]<<"o:"<<omap[i][y]<<"d:"<<d<<endl;
      if(cmap[i][y]==0)
      {
        
        d++;
        if(omap[i][y]!=0)
          seen++;

        omap[i][y]=0;
      
      }
      else if(cmap[i][y]==1&&d<x)
      {
         if(d==0)
          {d=-1;}
         //dist[2]=d;cout<<"DL2:"<<d<<endl;
        d=-1;
        if(omap[i][y]!=1)
          seen++;
        omap[i][y]=1;
        break;
        
      }
        
    }//cout<<"DL3:"<<d<<endl;
   // cout<<"D"<<d<<endl;
     if(d==0)
     {
     // cout<<"DL4:"<<d<<endl;
      
     d=-1; 
     dist[2]=d;
   }
   if(i==-1)
    dist[2]=d;
   return d;

}


//right sensor
int senseR(int x,int y)
{
    int d=0;int i;
    for(i=x+1;i<n;i++)
    {

     // cout<<i<<":c:"<<cmap[i][y]<<"o:"<<omap[i][y]<<"d:"<<d<<endl;
      if(cmap[i][y]==0)
      {
        d++;
        if(omap[i][y]!=0)
          seen++;
        omap[i][y]=0;
      
      }
      else if(cmap[i][y]==1&&d<(n-x-1))
      {
           if(d==0)
          {d=-1;}
           dist[0]=d;
        d=-1;
        if(omap[i][y]!=1)
          seen++;
        omap[i][y]=1;
         
         break;
        
      }
        
    }

     if(d==0)
     {
      d=-1;
      dist[0]=d;
      
    }
    if(i==n)
      dist[0]=d;
   
   return d;

}


//top sensor
int senseT(int x,int y)
{
    int d=0;int i;
    for(i=y-1;i>=0;i--)
    {

         // cout<<i<<":c:"<<cmap[i][y]<<"o:"<<omap[i][y]<<"d:"<<d<<endl;
      if(cmap[x][i]==0)
      {
        d++;
        if(omap[x][i]!=0)
          seen++;
        omap[x][i]=0;
      
      }
      else if(cmap[x][i]==1&&d<y)
      {
            if(d==0)
          {d=-1;}
             dist[3]=d;
        d=-1;

        if(omap[x][i]!=1)
          seen++;
        omap[x][i]=1;
       
        break;
      }
        
    }

   
     if(d==0)
     {
         d=-1; 
      dist[3]=d;
  
      
   }
   if(i==-1)
    dist[3]=d;

   return d;

}

//bottomsensor
int senseD(int x,int y)
{
    int d=0;int i;
    for( i=y+1;i<m;i++)
    {
     // cout<<i<<":c:"<<cmap[i][y]<<"o:"<<omap[i][y]<<"d:"<<d<<endl;
      
      if(cmap[x][i]==0)
      {
          //cout<<"DD1:"<<d<<endl;
        d++;
        
        if(omap[x][i]!=0)
          seen++;
        omap[x][i]=0;
      
      }
      else if(cmap[x][i]==1 && d<(m-1-y))
      {
        if(d==0)
          {d=-1;}
         dist[1]=d;
        d=-1;
        if(omap[x][i]!=1)
          seen++;
        omap[x][i]=1;
        break;
      }
        
    }
     // cout<<"D"<<d<<endl;
   // cout<<"DD2:"<<dist[1]<<endl;
      if(d==0)
      { 
        d=-1;dist[1]=d;
     
   }
   if(i==m)
    dist[1]=d;
      
  
   
   return d;

}
void sense(int x,int y)
{
    cost[0]=senseR(x,y);
    cost[1]=senseD(x,y);
    cost[2]=senseL(x,y);
    cost[3]=senseT(x,y);

   /* for(int i =0;i<4;i++)
      cout<<cost[i]<<endl;
    //cout<<seen<<endl;
    
    for(int i =0;i<4;i++)
     cout<<dist[i]<<endl;
   // cout<<cost[i]<<endl;*/

}
int choosedir(int x,int y)
{
   sense(x,y);

    int i=max(cost);
    if(cost[i]==-1)
    {
       i=max(dist);
    }
  //  cout<<"i:"<<i<<endl;
    return i;
    
}

int movedir(int x, int y, int i)
{
      int j=0;
      while(j++<(n*m)/2){ //50 percent of moves
        cout<<"Seen: "<<seen<<endl;;
       // cout<<"cost:"<<cost[i]<<"dist:"<<dist[i]<<endl;
         dispomap();
     // while(!(cost[i]==-1&&dist[i]==-1))
      if(cost[i]==-1&&dist[i]==-1)
      {
               // cout<<"choosing direction again"<<endl;
       // i=choosedir(x,y);
        sense(x,y);
        cost[opp[i]]=-1;
        dist[opp[i]]=-1;
         i=max(cost);
        if(cost[i]==-1)
       {
         i=max(dist);
        }
        //  cout<<cost[i]<<" "<<cost[opp[i]]<<" i:"<<i<<endl;
      }
        
      else
      {
        x=x+dx[i];
      y=y+dy[i];
    
     sense(x,y);
  }}
      return 0;

}


int max(int a[dir])
{
  int m=0;
  for(int i=1;i<dir;i++)
    {if(a[i]>a[m])
      m=i;
     
    }
    return m;

}


int main()
{
    srand(time(NULL));
    
    // create empty map
    for(int y=0;y<m;y++)
    {
        for(int x=0;x<n;x++) {cmap[x][y]=0; omap[x][y]=3;}
    }


    
    // fillout the map matrix with a '#' pattern
    //from here filling obstacles CHANGE N,M=20
   for(int i=3;i<=15;i++)
   {
        cmap[3][i] = 1;
   }
   for(int i=3;i<=15;i++)
   {
        cmap[18][i] = 1;
   }
   for(int i=3;i<=17;i++)
   {
        cmap[i][15] = 1;
   }
   for(int i=3;i<=17;i++)
   {
        cmap[i][3] = 1;
   }

  //FOR N,M=6
   cmap[0][0]=1;
   cmap[19][0]=1;
   /*cmap[0][5]=1;
   cmap[2][3]=1;
   cmap[3][3]=1;
   cmap[2][4]=1;
   cmap[3][5]=1*/;
   //till here filling obstacles

    //start and finish locations
    int xA=8, yA=18;// xB=10, yB=20;
    int x=xA;
    int y=yA;

     cmap[x][y]=0;
     omap[x][y]=2;  

    dispcmap();// display actual map with obstacles

    int j=0;
    int s=0; //status: reverse?
    dispomap();// display map read by bot
    int i=choosedir(x,y);

    //while(j++<5)
    //{
      s=movedir(x,y,i);
         //}
     
        
  
    //getchar(); // wait for a (Enter) keypress
    return(0);
}
