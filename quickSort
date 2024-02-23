#include <iostream>
using namespace std;

int partition(int arr[], int first, int last){
	int pivot = arr[last];
	int i = first-1;
//	int j = first;
	for (int j=first; j<= last-1; j++){
		if (arr[j] <= pivot){
			i++;
			swap(arr[i],arr[j]);
		}
	}
	swap(arr[i + 1], arr[last]);
	return i+1;
}

void quickSort(int arr[],int first, int last){
	if (last > first){
	int pi = partition(arr,first,last);
	quickSort(arr,first,pi-1);
	quickSort(arr,pi+1,last);
	}	
}
	
int main(){
	int arr[] = {7,11,18,2,6};
	int size = sizeof(arr)/sizeof(arr[0]);
	for(int i = 0; i < size; i++){	
	cout<<arr[i]<<" ";
	}
	cout<<" \n";
	quickSort(arr,0,size-1);
	for (int i=0;i<size;i++){
		cout<<arr[i]<<" ";
	}	
}
