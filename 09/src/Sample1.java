import java.security.MessageDigest;
public class Sample1 {
	public static void main(String[] args) throws Exception {
		String str = "aああwwwkos";
		long t1 = System.nanoTime();
		str=getMessageDigest(str);
		long t2 = System.nanoTime();

		System.out.println("処理時間="+ (t2 - t1) );
		System.out.println(str);
	}

	static String getMessageDigest(String data) throws Exception{
		StringBuffer sb = new StringBuffer();
		MessageDigest md5 = MessageDigest.getInstance("SHA-1");
		byte[] result = md5.digest(data.getBytes());
		for(byte b : result){
			int b2 = b & 0xff;
			if(b2 < 16) sb.append("0");
			sb.append(Integer.toHexString(b2));
		}
		return sb.toString();
	}
}
