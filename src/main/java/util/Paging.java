package util;

/*
        nowPage:����������
        rowTotal:��ü�����Ͱ���
        blockList:���������� �Խù���
        blockPage:��ȭ�鿡 ��Ÿ�� ������ ��ϼ�
 */
public class Paging {
	public static String getPaging(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage) {

		int totalPage/* ��ü�������� */, startPage/* ������������ȣ */, endPage;/* ��������������ȣ */

		boolean isPrevPage, isNextPage;
		StringBuffer sb; // ��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��

		isPrevPage = isNextPage = false;
		// �Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
		totalPage = (int) (rowTotal / blockList);
		if (rowTotal % blockList != 0)
			totalPage++;

		// ���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
		// ���� ��� ������ ���������� ���� ��ü ������ ������ ����
		if (nowPage > totalPage)
			nowPage = totalPage;

		// ���� �������� ������ �������� ����.
		startPage = (int) (((nowPage - 1) / blockPage) * blockPage + 1);
		endPage = startPage + blockPage - 1; //

		// ������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
		if (endPage > totalPage)
			endPage = totalPage;

		// �������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
		// boolean�� ������ ���� ����
		if (endPage < totalPage)
			isNextPage = true;
		// ������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
		if (startPage > 1)
			isPrevPage = true;

		// HTML�ڵ带 ������ StringBuffer����=>�ڵ����
		sb = new StringBuffer();
		// -----�׷�������ó�� ����
		// --------------------------------------------------------------------------------------------
		if (isPrevPage) {
			sb.append("<li><a href ='" + pageURL + "?page=");
			sb.append(startPage - 1);
			sb.append("' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else
			
			sb.append("<li><a href ='" + pageURL + "?page=");
			sb.append(startPage);
			sb.append("' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");

		// ------������ ��� ���
		// -------------------------------------------------------------------------------------------------

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage)
				break;
			if (i == nowPage) { // ���� �ִ� ������
				sb.append("<li><a href='#' style='color:#000093'>");
				sb.append(i);
				sb.append("</a></li>");
			} else {// ���� �������� �ƴϸ�
				sb.append("<li><a href='" + pageURL + "?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a></li>");
			}
		} // end for



		// -----�׷�������ó�� ����
		// ----------------------------------------------------------------------------------------------
		if (isNextPage) {
			sb.append("<li><a href ='" + pageURL + "?page=");
			sb.append(endPage +1);
			sb.append("' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else
			sb.append("<li><a href ='" + pageURL + "?page=");
			sb.append(endPage);
			sb.append("' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");

		// ---------------------------------------------------------------------------------------------------------------------

		return sb.toString();
	}

}