"""
***************************
--------description--------
Author: chenxu.tian 472159011@qq.com
Date: 2024-07-24 21:58:55
LastEditors: chenxu.tian 472159011@qq.com
LastEditTime: 2024-07-28 12:51:31
FilePath: \node_to_wgsl\__init__.py
Description: 

Copyright (c) 2024 by chenxu.tian 472159011@qq.com, All Rights Reserved. 

***************************
"""
import bpy

from .operators.convert_tree import ConvertTree


bl_info = {
    "name": "node2wgsl",
    "author": "chenxu.tian",
    "version": (0, 0, 1),
    "blender": (4, 1, 1),
    "description" : "geometry nodes to WGSL",
    "category" : "Node"
}


class GeometryNodesExportWGSL(bpy.types.Panel):
    bl_label = "导出wgsl"
    bl_idname = "NODE_PT_export_WGSL"
    bl_space_type = 'NODE_EDITOR'
    bl_region_type = 'UI'
    bl_category = "Tool"  # 这将把面板放在Tool中

    def draw(self, context: bpy.types.Context):
        self.layout.operator(ConvertTree.bl_idname, text="导出WGSL", icon="GEOMETRY_NODES")


class GeometryNodesExportWGSLSetting(bpy.types.AddonPreferences):
    bl_idname = __package__

    dependency_bevy: bpy.props.BoolProperty(
        name="Enable Bevy import",
        description="是否开启bevy import语法",
        default=True,
    )

    def draw(self, context: bpy.types.Context):
        self.layout.prop(self, "dependency_bevy")


def register():
    bpy.utils.register_class(ConvertTree)
    bpy.utils.register_class(GeometryNodesExportWGSL)
    bpy.utils.register_class(GeometryNodesExportWGSLSetting)


def unregister():
    bpy.utils.unregister_class(ConvertTree)
    bpy.utils.unregister_class(GeometryNodesExportWGSL)
    bpy.utils.unregister_class(GeometryNodesExportWGSLSetting)



if __name__ == "__main__":
    register()
