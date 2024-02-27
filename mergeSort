#include <iostream>
using namespace std;
int merge(int arr[],int l,int r,int mid){
    int aOne = mid - l + 1;
    int bOne = r - mid;
    int a[aOne];
    int b[bOne];
    for (int i = 0; i < aOne ; i++){
        a[i] = arr[l+i];
    }
    for (int j = 0; j < bOne; j++){
        b[j] = arr[mid + 1 + j];
    }
    int i = 0;
    int j = 0;
    int k = 0;
    while(i < aOne && j < bOne){
        if (a[i] < b[j]){
            arr[k++] = a[i++];
        }
        else{
            arr[k++] = b[j++];
        }
    }
    while(i<aOne){
        arr[k++] = a[i++];
    }
    while(j<bOne){
        arr[k++] = b[j++];
    }
}
void mergeSort(int arr[], int l, int r) {
    if (l < r) {  // Compare l and r directly
        int mid = l + (r - l) / 2;
        mergeSort(arr, l, mid);
        mergeSort(arr, mid + 1, r);
        merge(arr, l, r, mid);
    }
}


int main(){
    int arr[] = {7,11,18,2,6};
	int size = sizeof(arr)/sizeof(arr[0]);
	for(int i = 0; i < size; i++){	
	cout<<arr[i]<<" ";
	}
	cout<<" \n";
	mergeSort(arr,0,size-1);
	for (int i=0;i<size;i++){
		cout<<arr[i]<<" ";
	}
}
