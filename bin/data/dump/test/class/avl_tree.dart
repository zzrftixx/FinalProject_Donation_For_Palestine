import 'dart:math';

class TreeNode<T> {
  String key;
  T data;
  TreeNode<T>? left;
  TreeNode<T>? right;
  int height;

  TreeNode(this.key, this.data, {this.left, this.right, this.height = 1});
}

class AVLTree<T> {
  TreeNode<T>? root;

  int height(TreeNode<T>? node) => node?.height ?? 0;

  int balanceFactor(TreeNode<T>? node) {
    if (node == null) return 0;
    return height(node.left) - height(node.right);
  }

  TreeNode<T> rotateRight(TreeNode<T> y) {
    TreeNode<T> x = y.left!;
    TreeNode<T>? T2 = x.right;
    x.right = y;
    y.left = T2;
    y.height = 1 + max(height(y.left), height(y.right));
    x.height = 1 + max(height(x.left), height(x.right));
    return x;
  }

  TreeNode<T> rotateLeft(TreeNode<T> x) {
    TreeNode<T> y = x.right!;
    TreeNode<T>? T2 = y.left;
    y.left = x;
    x.right = T2;
    x.height = 1 + max(height(x.left), height(x.right));
    y.height = 1 + max(height(y.left), height(y.right));
    return y;
  }

  TreeNode<T> insert(TreeNode<T>? node, String key, T data) {
    if (node == null) return TreeNode<T>(key, data);
    if (key.compareTo(node.key) < 0) {
      node.left = insert(node.left, key, data);
    } else if (key.compareTo(node.key) > 0) {
      node.right = insert(node.right, key, data);
    } else {
      return node;
    }

    node.height = 1 + max(height(node.left), height(node.right));

    int balance = balanceFactor(node);

    if (balance > 1 && key.compareTo(node.left!.key) < 0) {
      return rotateRight(node);
    }
    if (balance < -1 && key.compareTo(node.right!.key) > 0) {
      return rotateLeft(node);
    }
    if (balance > 1 && key.compareTo(node.left!.key) > 0) {
      node.left = rotateLeft(node.left!);
      return rotateRight(node);
    }
    if (balance < -1 && key.compareTo(node.right!.key) < 0) {
      node.right = rotateRight(node.right!);
      return rotateLeft(node);
    }

    return node;
  }

  void insertNode(String key, T data) {
    root = insert(root, key, data);
  }

  T? search(TreeNode<T>? node, String key) {
    if (node == null) return null;
    if (key.compareTo(node.key) < 0) return search(node.left, key);
    if (key.compareTo(node.key) > 0) return search(node.right, key);
    return node.data;
  }

  T? searchNode(String key) {
    return search(root, key);
  }
}
