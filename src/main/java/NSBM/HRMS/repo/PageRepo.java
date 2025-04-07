/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NSBM.HRMS.repo;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import NSBM.HRMS.model.Page;
import NSBM.HRMS.dto.GetPagesDTO;

/**
 *
 * @author rusir
 */
@Repository
public interface PageRepo extends CrudRepository<Page, Integer> {

    @Query("WITH RECURSIVE nums AS (SELECT 0 AS n UNION ALL SELECT n + 1 FROM nums WHERE n + 1 < 50),pgs AS (\n"
            + "SELECT CAST(JSON_UNQUOTE(JSON_EXTRACT(ut.pages, CONCAT('$[', nums.n, ']'))) AS UNSIGNED) AS page_id\n"
            + "FROM user_type ut JOIN `user` u ON ut.id = u.user_type JOIN nums ON nums.n < JSON_LENGTH(ut.pages) WHERE u.id = :uid),p AS (\n"
            + "SELECT id, parent FROM pages WHERE id IN (SELECT page_id FROM pgs)\n"
            + "UNION SELECT pp.id, pp.parent FROM pages pp JOIN p ON pp.id = p.parent)\n"
            + "SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{','\"name\":\"', l1.name, '\",','\"url\":\"', l1.url, '\",','\"icon\":\"', IFNULL(l1.icon, ''), '\",','\"odr\":', IFNULL(l1.odr, 10000), ',','\"pages\":', '[', IFNULL((\n"
            + "SELECT GROUP_CONCAT(CONCAT('{','\"name\":\"', l2.name, '\",', '\"url\":\"', l2.url, '\",','\"icon\":\"', IFNULL(l2.icon, ''), '\",','\"odr\":', IFNULL(l2.odr, 10000), ',','\"pages\":', '[', IFNULL((\n"
            + "SELECT GROUP_CONCAT(CONCAT('{', '\"name\":\"', l3.name, '\",','\"url\":\"', l3.url, '\",','\"icon\":\"', IFNULL(l3.icon, ''), '\",','\"odr\":', IFNULL(l3.odr, 10000), '}')SEPARATOR ', ' )\n"
            + "FROM pages l3 WHERE l3.level = 3 AND l3.parent = l2.id AND l3.status = 'active' AND l3.id IN (SELECT id FROM p)), ''), ']' ,'}')\n"
            + "SEPARATOR ', ')FROM pages l2 WHERE l2.level = 2 AND l2.parent = l1.id AND l2.status = 'active' AND l2.id IN (SELECT id FROM p) ), ''), ']','}')\n"
            + "SEPARATOR ', '), ']') AS pgs FROM pages l1 WHERE l1.level = 1 AND l1.status = 'active' AND l1.id IN (SELECT id FROM p);"
    )
    String getAllPages(@Param("uid") String uid);

    @Query("SELECT (SELECT JSON_ARRAYAGG(JSON_OBJECT( 'odr',`odr`,'id',`id`,'parent',`parent`,'name',`name`,'level',`level`,'url',`url`)) FROM `pages`)as `all_page`")
    GetPagesDTO getPage();

    @Query("SELECT `id`,`name`,`dashboard`,(SELECT `name` FROM `dashboard` WHERE id = u.`dashboard`) AS `dashboard_name`,(SELECT JSON_ARRAYAGG(JSON_OBJECT( 'odr',`odr`,'id',`id`,'parent',`parent`,'name',`name`,'level',`level`,'url',`url`,'state',JSON_OBJECT('selected',IF(a.access IS NULL,CAST(FALSE AS JSON),CAST(TRUE AS JSON))))) FROM `pages` p LEFT JOIN (SELECT j.* FROM `user_type` t CROSS JOIN JSON_TABLE(t.`pages`,'$[*]' COLUMNS(`access` INT path '$[0]'))j WHERE t.`id`=:utid)a ON p.id=a.access)AS `all_page`  FROM `user_type` u WHERE id =:utid")
    GetPagesDTO getSelectedPage(@Param("utid") Integer utid);
}
