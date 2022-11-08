package model.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

import model.bean.Book;
import model.bean.Comment;
import model.bean.Image;
import model.dao.DBConnection;


public class CtrBook {
	
	private DBConnection connection;
	
	public CtrBook() {
		connection = new DBConnection();
	}
	
	public String addBook(String tenSach, int giaSach, String theLoai, String NXB, String tacGia, String moTa, String duongDanAnh) {
		//Thêm sách mới vào bảng
		String maSach = "";
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn_Book = connection.createParams(new int[] { 2, 3, 4, 5, 6, 7},
					new Object[] { tenSach, giaSach, theLoai, NXB, tacGia, moTa});
			Vector<Object[]> paramsOut_Book = connection.createParams(new int[] {1}, new Object[] {Types.VARCHAR});
			Object[] result = connection.executeProcedure("sp_ThemSachMoi", paramsIn_Book, paramsOut_Book, null);
			
			if (result != null && result.length > 0 && duongDanAnh != null) {
				maSach = result[0].toString();
				CtrImage control_Image = new CtrImage();
				control_Image.addImage(maSach, duongDanAnh);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		
		return maSach;
	}
	
	public void setRate(String maSach, double rate) {
		//Cập nhật mức độ đánh giá cho sách
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1, 2}, new Object[] {maSach, rate});
			connection.executeProcedure("sp_ChinhSuaDanhGiaSach", paramsIn, null, null);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
	}
	
	public void updateBook(Book book) {
		//Cập nhật thông tin cho cuốn sách theo mã sách
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn_Book = connection.createParams(new int[] { 1, 2, 3, 4, 5, 6, 7}, 
					new Object[] {book.getMaSach(), book.getTenSach(), book.getGiaBan(), book.getTheLoai(), book.getNXB(), book.getTacGia(), book.getMoTa()});
			connection.executeProcedure("sp_ChinhSuaSach", paramsIn_Book, null, null);
			
			CtrImage control_Image = new CtrImage();
			control_Image.updateImage(book.getImages());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
	}
	
	public Book[] getAllBook() {
		//Trả v�? danh sách sách có trong bảng
		Vector<Book> result = new Vector<>();
		connection.connect();
		
		try {
			ResultSet resultSet = connection.executeTableFunction("fc_getAllBook", null);
			while (resultSet.next()) {
				Book book = new Book();
				CtrImage ctrImage = new CtrImage();
				
				//Add value to Book
				book.setMaSach(resultSet.getString(1));
				book.setTenSach(resultSet.getString(2));
				book.setGiaBan(resultSet.getInt(3));
				book.setTheLoai(resultSet.getString(4));
				book.setNXB(resultSet.getString(5));
				book.setTacGia(resultSet.getString(6));
				book.setMoTa(resultSet.getString(7));
				book.setRate(resultSet.getDouble(8));
				
				Image[] images = ctrImage.getImageById(null, book.getMaSach());
				//Xét trư�?ng hợp mỗi sách chỉ cần một hình để hiển thị
				if (images != null && images.length > 0)
				book.setImages(images[0]);
				
				result.addElement(book);
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		return result.toArray(new Book[0]);
	}
	
	public Book getBookById(String Id) {
		//Trả v�? sách có id trong bảng
		Book result = null;
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1}, new Object[] {Id});
			ResultSet resultSet = connection.executeTableFunction("fc_getBookById", paramsIn);
			while (resultSet.next()) {
				result = new Book();
				
				//Add value to Book
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//Xét trư�?ng hợp mỗi sách chỉ cần một hình để hiển thị
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		return result;
	}
	public Book[] getSearchBook(String Search) {
		//Tìm kiếm sách
		Vector<Book> Books = new Vector<>();
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1}, new Object[] {Search});
			ResultSet resultSet = connection.executeTableFunction("fc_getSearchBook", paramsIn);		
			while(resultSet.next()) {
				Book result = new Book();
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//Xét trư�?ng hợp mỗi sách chỉ cần một hình để hiển thị
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				Books.addElement(result);
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		return Books.toArray(new Book[0]);
	}
	
	public Book[] getSearchCat(String SearchCat) {
		//TÃ¬m kiáº¿m sÃ¡ch
		Vector<Book> Books = new Vector<>();
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1}, new Object[] {SearchCat});
			ResultSet resultSet = connection.executeTableFunction("fc_getSearchCat", paramsIn);		
			while(resultSet.next()) {
				Book result = new Book();
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//XÃ©t trÆ°ï¿½?ng há»£p má»—i sÃ¡ch chá»‰ cáº§n má»™t hÃ¬nh Ä‘á»ƒ hiá»ƒn thá»‹
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				Books.addElement(result);
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		return Books.toArray(new Book[0]);
	}
	
	public Book[] getTopBanChay() {
		Vector<Book> books = new Vector<>();
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			ResultSet resultSet = connection.executeTableFunction("fc_getTOPBookBan", null);
			while(resultSet.next()) {
				Book result = new Book();
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//XÃ©t trÆ°ï¿½?ng há»£p má»—i sÃ¡ch chá»‰ cáº§n má»™t hÃ¬nh Ä‘á»ƒ hiá»ƒn thá»‹
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				books.addElement(result);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			 connection.close();
		}
		
		return books.toArray(new Book[0]);
	}
	
	public Book[] getTopYeuThich() {
		Vector<Book> books = new Vector<>();
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			ResultSet resultSet = connection.executeTableFunction("fc_getTOPBookDG", null);
			while(resultSet.next()) {
				Book result = new Book();
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//XÃ©t trÆ°ï¿½?ng há»£p má»—i sÃ¡ch chá»‰ cáº§n má»™t hÃ¬nh Ä‘á»ƒ hiá»ƒn thá»‹
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				books.addElement(result);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			 connection.close();
		}
		
		return books.toArray(new Book[0]);
	}
	
	public Book[] getTopBanChay(int top) {
		Vector<Book> books = new Vector<>();
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			ResultSet resultSet = connection.executeTableFunction("fc_getTOPBookBan", null);
			while(resultSet.next() && top > 0) {
				Book result = new Book();
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//XÃ©t trÆ°ï¿½?ng há»£p má»—i sÃ¡ch chá»‰ cáº§n má»™t hÃ¬nh Ä‘á»ƒ hiá»ƒn thá»‹
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				books.addElement(result);
				top--;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			 connection.close();
		}
		
		return books.toArray(new Book[0]);
	}
	
	public Book[] getTopYeuThich(int top) {
		Vector<Book> books = new Vector<>();
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			ResultSet resultSet = connection.executeTableFunction("fc_getTOPBookDG", null);
			while(resultSet.next() && top > 0) {
				Book result = new Book();
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//XÃ©t trÆ°ï¿½?ng há»£p má»—i sÃ¡ch chá»‰ cáº§n má»™t hÃ¬nh Ä‘á»ƒ hiá»ƒn thá»‹
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				books.addElement(result);
				top--;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			 connection.close();
		}
		
		return books.toArray(new Book[0]);
	}
	
	public Book[] getBookTT(String MaSach) {
		//TÃ¬m kiáº¿m sÃ¡ch
		Vector<Book> Books = new Vector<>();
		CtrImage ctrImage = new CtrImage();
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1}, new Object[] {MaSach});
			ResultSet resultSet = connection.executeTableFunction("fc_getBookTT", paramsIn);		
			while(resultSet.next()) {
				Book result = new Book();
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				result.setRate(resultSet.getDouble(8));
				Image[] images = ctrImage.getImageById(null, result.getMaSach());
				//XÃ©t trÆ°ï¿½?ng há»£p má»—i sÃ¡ch chá»‰ cáº§n má»™t hÃ¬nh Ä‘á»ƒ hiá»ƒn thá»‹
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				Books.addElement(result);
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		return Books.toArray(new Book[0]);
	}
}
