
# CountDownLatch
    等待所有线程执行完后再进行操作,用法
        设置线程的总数目
            CountDownLatch countDownLatch = new CountDownLatch(threadNum);
        每执行完一个线程,计数减一
            countDownLatch.countDown();
        等待所有线程执行完
            countDownLatch.await();

# Semaphore
    控制同时执行的线程数
        设置同时执行的最大线程数
            Semaphore semaphore = new Semaphore(num);
        获取许可
            semaphore.acquire([num]);
            or
            semaphore.tryAcquire([num]);
        释放许可
            semaphore.release();
            semaphore.release([num]);

# CyclicBarrier
    线程等待其它几个线程准备好后再继续执行
        设置等待的线程数
            CyclicBarrier cyclicBarrier = new CycliBarrier(num);
        设置一个线程执行到哪里开始等待其它线程
            a个线程都执行到这里
            cyclicBarrier.await();
            a个线程开始执行后续操作

# ReentrantLock
    1.可指定公平锁还是非公平锁
    2.提供一个Condition类,可以分组唤醒需要唤醒的线程
    3.提供能供中断等待锁的线程机制,lock.lockInterruptibly()