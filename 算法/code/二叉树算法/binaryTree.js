function BinaryTree() {
    //定义一个节点
    var Node = function (key) {
        this.key = key;
        this.left = null;
        this.right = null;
    }
    //设置二叉树的根节点
    var root = null;
    this.logRoot = function () {
        console.log(root);
    }
    //插入新节点
    var insertNode = function (node, newNode) {
        if (newNode.key < node.key) {
            if (node.left === null) {
                node.left = newNode;
            } else {
                insertNode(node.left, newNode);
            }
        } else {
            if (node.right === null) {
                node.right = newNode;
            } else {
                insertNode(node.right, newNode);
            }
        }
    }
    //插入节点
    this.insert = function (key) {
        var newNode = new Node(key);
        if (root === null) {
            root = newNode;
        } else {
            insertNode(root, newNode);
        }
        //console.log(root);
    }

    //中序遍历节点
    var inOrderTraverseNode = function (node, callback) {
        if (node !== null) {
            inOrderTraverseNode(node.left, callback);
            callback(node.key);
            inOrderTraverseNode(node.right, callback);
        }
    }
    this.inOrderTraverse = function (callback) {
        inOrderTraverseNode(root, callback);
    }
    //前序遍历
    var preOrderTraverseNode = function (node, callback) {
        if (node !== null) {
            callback(node.key);
            preOrderTraverseNode(node.left, callback);
            preOrderTraverseNode(node.right, callback);
        }
    }
    this.preOrderTraverse = function (callback) {
        preOrderTraverseNode(root, callback);
    }
    //后序遍历
    var postOrderTraverseNode = function (node, callback) {
        if (node !== null) {
            postOrderTraverseNode(node.left, callback);
            postOrderTraverseNode(node.right, callback);
            callback(node.key);
        }
    }
    this.postOrderTraverse = function (node, callback) {
        postOrderTraverse(root, callback);
    }

    //查找最小节点
    var minNode = function (node) {
        if (node !== null) {
            // if(node.left === null)
            //     return node.key;
            // minNode(node.left);
            while (node && node.left) {
                node = node.left;
            }
            return node.key;
        }
    }
    this.getMinNode = function () {
        return minNode(root);
    }
    //查找最大节点
    var maxNode = function (node) {
        if (node) {
            while (node && node.right) {
                node = node.right;
            }
            return node.key;
        }
        return node.key;
    }
    this.getMaxNode = function () {
        return maxNode(root);
    }
    //查找指定节点
    var searchNode = function (node, key) {
        if (node) {
            if (node.key > key && node.left) {
                return searchNode(node.left, key);
            } else if (node.key < key && node.left) {
                return searchNode(node.right, key);
            } else {
                return key;
            }
        }
        return false;
    }
    this.searchNodeByKey = function (key) {
        return searchNode(root, key);
    }
    //删除节点,节点的类型有：叶子节点，没有左子树的节点，没有右子树的节点，左右子树都有的节点
    var findMinChildNode = function (node) {
        if (node) {
            while (node.left) {
                node = node.left;
            }
            return node;
        }
        return null;
    }
    var removeNode = function (node, key) {
        if (node) {
            if (node.key > key && node.left) {
                node.left = removeNode(node.left, key);
                return node;
            } else if (node.key < key && node.right) {
                node.right = removeNode(node.right, key);
                return node;
            } else {
                if (node.right === null && node.left === null) { //删除叶子节点
                    node = null;
                    return node;
                } else if (node.left === null) {  //删除无左子树的节点
                    node = node.right;
                    return node;
                } else if (node.right === null) {  //删除无右子树的节点
                    node = node.left;
                    return node;
                } else {  //删除有左右子树木的节点
                    var aux = findMinChildNode(node.right);
                    node.key = aux.key;
                    node.right = removeNode(node.right, aux.key);
                    return node;
                }
            }
        }
    }
    this.removeNodeByKey = function (key) {
        removeNode(root, key);
    }
}