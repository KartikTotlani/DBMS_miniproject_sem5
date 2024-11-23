#include<stdio.h>
struct proc{
	int proc;
	int at;
	int bt;
	int wt;
	int tt;
};
void sort();
void calculation();

struct proc p[10];
int n,temp;

void main(){
	printf("Enter the numnber of process : ");
	scanf("%d",&n);

	printf("Enter the process number, arival time, bus time \n");
	for(int i=0;i<n;i++){
		scanf("%d%d%d",&p[i].proc,&p[i].at,&p[i].bt);
	sort();
	calculation();
}

void sort(){
	struct proc temp_swap;
	for(int i=0;i<n-1;i++){
		for(int j=0;j<n-1;j++){
			if(p[j].at>p[j+1].at){
				temp_swap=p[j];
				p[j]=p[j+1];
				p[j+1]=temp_swap;
			}
		}
	}
	printf("Process id  Arival Time  Bus time\n");
	for(int i=0;i<n;i++){
		printf("%d\t%d\t%d\n",p[i].proc,p[i].at,p[i].bt);
	}
}
void calculation(){
	float atat,awt;
	float a=0;
	float b=0;
	p[0].tt=p[0].at+p[0].bt;
	for(int i=1;i<n;i++){
		if(p[i-1].tt>p[i].at){
			p[i].tt=p[i-1].tt+p[i].bt;
			}
		else{
			p[i].tt=p[i].at+p[i].bt;
		}
	}
	for(int i=0;i<n;i++){
		p[i].tt=p[i].tt-p[i].at;
		p[i].wt=p[i].tt-p[i].bt;
	}
	printf("Process\tAT\tBT\tTT\tWT\n");
	for(int i=0;i<n;i++){
		printf("%d\t%d\t%d\t%d\t%d \n",p[i].proc,p[i].at,p[i].bt,p[i].tt,p[i].wt);
		
	}
	for(int i=0;i<n;i++){
		a+=p[i].tt;
		b+=p[i].wt;
	}
	atat=a/n;
	awt=b/n;
	printf("Average turn around time : %f\n",atat);
	printf("Average Wating time : %f\n",awt);
}

