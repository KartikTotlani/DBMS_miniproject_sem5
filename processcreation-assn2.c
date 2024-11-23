#include<stdio.h>
#include<sys/types.h>
#include<ctype.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>

void asc(int *,int);
void dsc(int*,int);

int main(){
	int *a,n,i;
	pid_t pid;
	printf("\nEnter the Number of Array Elements : ");
	scanf("%d",&n);
	a=(int*)malloc(n*sizeof(int));
	printf("\nEnter the Array elements : ");
	for(int i=0;i<n;i++){
		printf("\na[%d] : ",i);
		scanf("%d",&a[i]);
	}
	printf("\n");

	pid=fork();
	
	if(pid<0){
		perror("Fork Error\n");
	}
	else if(pid==0){
		printf("Child Process ID : %ld",(long)getpid());
	}
	else{
		printf("Parent Process ID : %ld",(long)getpid());
	}

	switch(pid){
		case -1:
			printf("\nFork Error\n");
			exit(-1);

		case 0:
			printf("\nChild Executes...\n");
			//system("ps -elf");
			asc(a,n);
			exit(pid);

		default:
			//wait(NULL);
			printf("\nParent Executes...\n");
			dsc(a,n);
			system("ps -elf");
			exit(pid);
	}

}

void asc(int *a,int n){
	for(int i=0;i<n;i++){
		for(int j=0;j<n;j++){
			if(a[i]>a[j]){
				int temp=a[i];
				a[i]=a[j];
				a[j]=temp;
			}
		}
	}
	printf("\nArray in Ascending Order is : ");
	for(int i=0;i<n;i++){
		printf("%d ",a[i]);
	}
	printf("\n");
}

void dsc(int *a,int n){
	for(int i=0;i<n;i++){
		for(int j=0;j<n;j++){
			if(a[i]<a[j]){
				int temp=a[i];
				a[i]=a[j];
				a[j]=temp;
			}
		}
	}
	printf("\nArray in Decending order is : ");
	for(int i=0;i<n;i++)
		printf("%d ",a[i]);
	printf("\n");
}
