#include <iostream>
using namespace std;

struct node {
  int key;
  struct node *left, *right;
};

struct node *newNode(int item) {
  struct node *temp = new node;
  temp->key = item;
  temp->left = temp->right = NULL;
  return temp;
}

void inorder(struct node *root) {
  if (root != NULL) {
    inorder(root->left);
    cout << root->key << " -> ";
    inorder(root->right);
  }
}

struct node *insert(struct node *node, int key) {
  if (node == NULL) return newNode(key);

  if (key < node->key)
    node->left = insert(node->left, key);
  else if (key > node->key)
    node->right = insert(node->right, key);

  return node;
}

struct node *minValueNode(struct node *node) {
  struct node *current = node;
  while (current && current->left != NULL)
    current = current->left;
  return current;
}

struct node *deleteNode(struct node *root, int key) {
  if (root == NULL) return root;

  if (key < root->key)
    root->left = deleteNode(root->left, key);
  else if (key > root->key)
    root->right = deleteNode(root->right, key);
  else {
    if (root->left == NULL) {
      struct node *temp = root->right;
      delete root;
      return temp;
    } else if (root->right == NULL) {
      struct node *temp = root->left;
      delete root;
      return temp;
    }

    struct node *temp = minValueNode(root->right);
    root->key = temp->key;
    root->right = deleteNode(root->right, temp->key);
  }
  return root;
}

struct node *searchNode(struct node *root, int key) {
  if (root == NULL || root->key == key)
    return root;

  if (key < root->key)
    return searchNode(root->left, key);

  return searchNode(root->right, key);
}

int main() {
  struct node *root = NULL;
  int choice, value;

  do {
    cout << "\nMenu:\n";
    cout << "1. Insert\n";
    cout << "2. Delete\n";
    cout << "3. Search\n";
    cout << "4. Display Inorder Traversal\n";
    cout << "0. Exit\n";
    cout << "Enter your choice: ";
    cin >> choice;

    switch (choice) {
      case 1:
        cout << "Enter value to insert: ";
        cin >> value;
        root = insert(root, value);
        break;

      case 2:
        cout << "Enter value to delete: ";
        cin >> value;
        root = deleteNode(root, value);
        break;

      case 3:
        cout << "Enter value to search: ";
        cin >> value;
        if (searchNode(root, value))
          cout << value << " found in the BST.\n";
        else
          cout << value << " not found in the BST.\n";
        break;


      case 4:
        cout << "Inorder traversal: ";
        inorder(root);
        cout << endl;
        break;

      case 0:
        cout << "Exiting the program.\n";
        break;

      default:
        cout << "Invalid choice. Please try again.\n";
        break;
    }
  } while (choice != 0);

  return 0;
}
