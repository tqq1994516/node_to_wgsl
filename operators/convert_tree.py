"""
***************************
--------description--------
Author: chenxu.tian 472159011@qq.com
Date: 2024-07-24 23:00:15
LastEditors: chenxu.tian 472159011@qq.com
LastEditTime: 2024-07-25 21:50:57
FilePath: \node_to_wgsl\operators\convert_tree.py
Description: 

Copyright (c) 2024 by chenxu.tian 472159011@qq.com, All Rights Reserved. 

***************************
"""
import bpy
import os

class WGSLNode:
    node: bpy.types.Node
    sides: list[bpy.types.Node]

    def __init__(self, node) -> None:
        self.node = node
        self.sides = []


class ConvertTree(bpy.types.Operator):
    bl_idname = "node2wgsl.convert_tree"
    bl_label = "export WGSL"

    def execute(self, context: bpy.types.Context):
        dir = os.path.dirname(bpy.data.filepath)
        preferences = bpy.context.preferences.addons[__package__.split(".")[0]].preferences
        dependency_bevy = preferences.dependency_bevy
        graph: dict[int, WGSLNode] = {}
        if obj := context.active_object:
            if modifier := obj.modifiers.active:
                node_group: bpy.types.GeometryNodeTree = modifier.node_group
                for link in node_group.links:
                    from_node_id = id(link.from_node)
                    if from_node_id not in graph:
                        node = WGSLNode(link.from_node)
                        node.sides.append(link.to_node)
                        graph[from_node_id] = node
                    else:
                        if link.to_node not in graph[from_node_id].sides:
                            graph[from_node_id].sides.append(link.to_node)
        for k, v in graph.items():
            match v.node.name:
                case "Group Input":
                    ...
                case "Group Output":
                    ...
        return {'FINISHED'}
