import numpy as np
arr=np.array([1,2,3])
print(arr * 2)

# create 1d array
arr1=np.array([10,20,30,40,50])
print("\n1D Array:\n",arr1)

# create 1d array
arr2=np.array([[1, 2, 3],[4, 5, 6]])
print("\n2D Array:\n",arr2)


#reshape array-used to change the shape of an array without chnaging its data
reshaped=arr2.reshape(3,2)
print("\n Reshaped Array:",reshaped)

print("\nSUM:",arr1.sum())
print("\nMEAN:",arr1.mean())
print("\nMAX:",arr1.max())
print("\nMIN:",arr1.min())
print("\nSUM:",arr2.sum())
print("\nMEAN:",arr2.mean())
print("\nMAX:",arr2.max())
print("\nMIN:",arr2.min())