-- ------------------------------------------------------------
-- Horizon Respawn Time Changes (7 min dungeon, 12 min stronghold)
-- ------------------------------------------------------------
UPDATE mob_groups SET respawntime = '420' WHERE zoneid = 200 OR zoneid = 197 OR zoneid = 176 OR zoneid = 160 OR zoneid = 204 OR zoneid = 142 OR zoneid = 9 OR zoneid = 173 OR zoneid = 143 OR zoneid = 172 OR zoneid = 213 OR
                                                zoneid = 198 OR zoneid = 208 OR zoneid = 153 OR zoneid = 154 OR zoneid = 195 OR zoneid = 184 OR zoneid = 157 OR zoneid = 158 OR zoneid = 167 OR zoneid = 141 OR zoneid = 152 OR
                                                zoneid = 192 OR zoneid = 194 OR zoneid = 169 OR zoneid = 27 OR zoneid = 28 OR zoneid = 178 OR zoneid = 177 OR zoneid = 212 OR zoneid = 174 OR zoneid = 196 OR zoneid = 193 OR
                                                zoneid = 34 OR zoneid = 35;

UPDATE mob_groups SET respawntime = '960' WHERE zoneid = 152 OR zoneid = 151 OR zoneid = 147 OR zoneid = 148 OR zoneid = 12 OR zoneid = 11 OR zoneid = 149 OR zoneid = 150 OR zoneid = 161 OR zoneid = 162;
