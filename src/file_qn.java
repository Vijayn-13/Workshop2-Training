import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.*;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;

public class file_qn {
    public static void main(String[] args){
        try{
            String path="C:\\Users\\vijay.n\\Downloads\\input.txt";
            FileLock filelock = null;
            try(RandomAccessFile file=new RandomAccessFile(path,"rw");FileChannel channel = file.getChannel()){
                filelock = channel.lock();
                System.out.println("File locked successfully");
                //filelock.release();
                System.out.println("Lock released...");
                filelock = channel.lock();
                System.out.println("File locked successfully");
            }
            catch(OverlappingFileLockException oe){
                System.out.println("Overlapping FileLock Exception occurred");
            }
            finally{
                if(filelock!=null && filelock.isValid()){
                    filelock.release();
                }
            }
        }
        catch (IOException ie){
            System.out.println("Error occurred: "+ie.getMessage());
        }
    }
}
