(* @generated by hphp/hack/tools/visitors/genvisitors *)
open Ast_visitors_ancestors
class virtual ['self] iter =
  object (self : 'self)
    inherit [_] iter_base
    method on_Cst_define env = ()
    method on_Cst_const env = ()
    method on_cst_kind env = function
      | Cst_define -> self#on_Cst_define env
      | Cst_const -> self#on_Cst_const env
    method on_id env (c0, c1) =
      self#on_Pos_t env c0;
      self#on_string env c1;
    method on_pstring env (c0, c1) =
      self#on_Pos_t env c0;
      self#on_string env c1;
    method on_Covariant env = ()
    method on_Contravariant env = ()
    method on_Invariant env = ()
    method on_variance env = function
      | Covariant -> self#on_Covariant env
      | Contravariant -> self#on_Contravariant env
      | Invariant -> self#on_Invariant env
    method on_NSClass env = ()
    method on_NSNamespace env = ()
    method on_NSClassAndNamespace env = ()
    method on_NSFun env = ()
    method on_NSConst env = ()
    method on_ns_kind env = function
      | NSClassAndNamespace -> self#on_NSClassAndNamespace env
      | NSClass -> self#on_NSClass env
      | NSNamespace -> self#on_NSNamespace env
      | NSFun -> self#on_NSFun env
      | NSConst -> self#on_NSConst env
    method on_program env = self#on_list self#on_def env
    method on_Fun = self#on_fun_
    method on_Class = self#on_class_
    method on_Stmt = self#on_stmt
    method on_Typedef = self#on_typedef
    method on_Constant = self#on_gconst
    method on_Namespace env c0 c1 =
      self#on_id env c0;
      self#on_program env c1;
    method on_NamespaceUse env c0 =
      begin
        self#on_list
          (fun env (c0, c1, c2) ->
               self#on_ns_kind env c0;
               self#on_id env c1;
               self#on_id env c2; ()) env c0
      end;
    method on_SetNamespaceEnv env c0 =
      self#on_Namespace_env env c0;
    method on_def env = function
      | Fun c0 -> self#on_Fun env c0
      | Class c0 -> self#on_Class env c0
      | Stmt c0 -> self#on_Stmt env c0
      | Typedef c0 -> self#on_Typedef env c0
      | Constant c0 -> self#on_Constant env c0
      | Namespace (c0, c1) -> self#on_Namespace env c0 c1
      | NamespaceUse c0 -> self#on_NamespaceUse env c0
      | SetNamespaceEnv c0 -> self#on_SetNamespaceEnv env c0
    method on_typedef env this =
      self#on_id env this.t_id;
      self#on_list self#on_tparam env this.t_tparams;
      self#on_tconstraint env this.t_constraint;
      self#on_typedef_kind env this.t_kind;
      begin
        self#on_list self#on_user_attribute env
          this.t_user_attributes
      end;
      self#on_Namespace_env env this.t_namespace;
      self#on_FileInfo_mode env this.t_mode;
    method on_gconst env this =
      self#on_FileInfo_mode env this.cst_mode;
      self#on_cst_kind env this.cst_kind;
      self#on_id env this.cst_name;
      self#on_option self#on_hint env this.cst_type;
      self#on_expr env this.cst_value;
      self#on_Namespace_env env this.cst_namespace;
    method on_Constraint_as env = ()
    method on_Constraint_eq env = ()
    method on_Constraint_super env = ()
    method on_constraint_kind env = function
      | Constraint_as -> self#on_Constraint_as env
      | Constraint_eq -> self#on_Constraint_eq env
      | Constraint_super -> self#on_Constraint_super env
    method on_tparam env (c0, c1, c2) =
      self#on_variance env c0;
      self#on_id env c1;
      begin
        self#on_list
          (fun env (c0, c1) ->
               self#on_constraint_kind env c0;
               self#on_hint env c1; ()) env c2
      end;
    method on_tconstraint env = self#on_option self#on_hint env
    method on_Alias = self#on_hint
    method on_NewType = self#on_hint
    method on_typedef_kind env = function
      | Alias c0 -> self#on_Alias env c0
      | NewType c0 -> self#on_NewType env c0
    method on_class_ env this =
      self#on_FileInfo_mode env this.c_mode;
      begin
        self#on_list self#on_user_attribute env
          this.c_user_attributes
      end;
      self#on_bool env this.c_final;
      self#on_class_kind env this.c_kind;
      self#on_bool env this.c_is_xhp;
      self#on_id env this.c_name;
      self#on_list self#on_tparam env this.c_tparams;
      self#on_list self#on_hint env this.c_extends;
      self#on_list self#on_hint env this.c_implements;
      self#on_list self#on_class_elt env this.c_body;
      self#on_Namespace_env env this.c_namespace;
      self#on_option self#on_enum_ env this.c_enum;
      self#on_Pos_t env this.c_span;
    method on_enum_ env this =
      self#on_hint env this.e_base;
      self#on_option self#on_hint env this.e_constraint;
    method on_user_attribute env this =
      self#on_id env this.ua_name;
      self#on_list self#on_expr env this.ua_params;
    method on_Cabstract env = ()
    method on_Cnormal env = ()
    method on_Cinterface env = ()
    method on_Ctrait env = ()
    method on_Cenum env = ()
    method on_class_kind env = function
      | Cabstract -> self#on_Cabstract env
      | Cnormal -> self#on_Cnormal env
      | Cinterface -> self#on_Cinterface env
      | Ctrait -> self#on_Ctrait env
      | Cenum -> self#on_Cenum env
    method on_MustExtend env = ()
    method on_MustImplement env = ()
    method on_trait_req_kind env = function
      | MustExtend -> self#on_MustExtend env
      | MustImplement -> self#on_MustImplement env
    method on_Const env c0 c1 =
      self#on_option self#on_hint env c0;
      begin
        self#on_list
          (fun env (c0, c1) ->
               self#on_id env c0;
               self#on_expr env c1; ()) env c1
      end;
    method on_AbsConst env c0 c1 =
      self#on_option self#on_hint env c0;
      self#on_id env c1;
    method on_Attributes = self#on_list self#on_class_attr
    method on_TypeConst = self#on_typeconst
    method on_ClassUse = self#on_hint
    method on_ClassUseAlias env c0 c1 c2 c3 =
      self#on_option self#on_id env c0;
      self#on_pstring env c1;
      self#on_option self#on_id env c2;
      self#on_option self#on_kind env c3;
    method on_ClassUsePrecedence env c0 c1 c2 =
      self#on_id env c0;
      self#on_pstring env c1;
      self#on_list self#on_id env c2;
    method on_XhpAttrUse = self#on_hint
    method on_ClassTraitRequire env c0 c1 =
      self#on_trait_req_kind env c0;
      self#on_hint env c1;
    method on_ClassVars env c0 c1 c2 _ =
      self#on_list self#on_kind env c0;
      self#on_option self#on_hint env c1;
      self#on_list self#on_class_var env c2;
    method on_XhpAttr env c0 c1 c2 c3 =
      self#on_option self#on_hint env c0;
      self#on_class_var env c1;
      self#on_bool env c2;
      begin
        self#on_option
          (fun env (c0, c1) ->
               self#on_Pos_t env c0;
               self#on_list self#on_expr env c1; ())
          env c3
      end;
    method on_Method = self#on_method_
    method on_XhpCategory = self#on_list self#on_pstring
    method on_XhpChild = self#on_xhp_child
    method on_xhp_child env = function
      | ChildName c0 -> self#on_ChildName env c0
      | ChildList c0 -> self#on_ChildList env c0
      | ChildUnary (c0, c1) -> self#on_ChildUnary env c0 c1
      | ChildBinary (c0, c1) -> self#on_ChildBinary env c0 c1

    method on_ChildName = self#on_id
    method on_ChildList = self#on_list self#on_xhp_child
    method on_ChildUnary env c0 c1 =
      self#on_xhp_child env c0;
      self#on_xhp_child_op env c1

    method on_ChildBinary env c0 c1 =
      self#on_xhp_child env c0;
      self#on_xhp_child env c1

    method on_xhp_child_op env = function
      | ChildStar -> self#on_ChildStar env
      | ChildPlus -> self#on_ChildPlus env
      | ChildQuestion -> self#on_ChildQuestion env

    method on_ChildStar env = ()
    method on_ChildPlus env = ()
    method on_ChildQuestion env = ()

    method on_class_elt env = function
      | Const (c0, c1) -> self#on_Const env c0 c1
      | AbsConst (c0, c1) -> self#on_AbsConst env c0 c1
      | Attributes c0 -> self#on_Attributes env c0
      | TypeConst c0 -> self#on_TypeConst env c0
      | ClassUse c0 -> self#on_ClassUse env c0
      | ClassUseAlias (c0, c1, c2, c3) -> self#on_ClassUseAlias env c0 c1 c2 c3
      | ClassUsePrecedence (c0, c1, c2) ->
        self#on_ClassUsePrecedence env c0 c1 c2
      | XhpAttrUse c0 -> self#on_XhpAttrUse env c0
      | ClassTraitRequire (c0, c1) ->
          self#on_ClassTraitRequire env c0 c1
      | ClassVars (c0, c1, c2, c3) -> self#on_ClassVars env c0 c1 c2 c3
      | XhpAttr (c0, c1, c2, c3) -> self#on_XhpAttr env c0 c1 c2 c3
      | Method c0 -> self#on_Method env c0
      | XhpCategory c0 -> self#on_XhpCategory env c0
      | XhpChild c0 -> self#on_XhpChild env c0
    method on_CA_name = self#on_id
    method on_CA_field = self#on_ca_field
    method on_class_attr env = function
      | CA_name c0 -> self#on_CA_name env c0
      | CA_field c0 -> self#on_CA_field env c0
    method on_ca_field env this =
      self#on_ca_type env this.ca_type;
      self#on_id env this.ca_id;
      self#on_option self#on_expr env this.ca_value;
      self#on_bool env this.ca_required;
    method on_CA_hint = self#on_hint
    method on_CA_enum = self#on_list self#on_string
    method on_ca_type env = function
      | CA_hint c0 -> self#on_CA_hint env c0
      | CA_enum c0 -> self#on_CA_enum env c0
    method on_Final env = ()
    method on_Static env = ()
    method on_Abstract env = ()
    method on_Private env = ()
    method on_Public env = ()
    method on_Protected env = ()
    method on_kind env = function
      | Final -> self#on_Final env
      | Static -> self#on_Static env
      | Abstract -> self#on_Abstract env
      | Private -> self#on_Private env
      | Public -> self#on_Public env
      | Protected -> self#on_Protected env
    method on_Pinout env = ()
    method on_param_kind env = function
      | Pinout -> self#on_Pinout env
    method on_OG_nullthrows env = ()
    method on_OG_nullsafe env = ()
    method on_og_null_flavor env = function
      | OG_nullthrows -> self#on_OG_nullthrows env
      | OG_nullsafe -> self#on_OG_nullsafe env
    method on_class_var env (c0, c1, c2) =
      self#on_Pos_t env c0;
      self#on_id env c1;
      self#on_option self#on_expr env c2;
    method on_method_ env this =
      self#on_list self#on_kind env this.m_kind;
      self#on_list self#on_tparam env this.m_tparams;
      begin
        self#on_list
          (fun env (c0, c1, c2) ->
               self#on_hint env c0;
               self#on_constraint_kind env c1;
               self#on_hint env c2; ()) env this.m_constrs
      end;
      self#on_id env this.m_name;
      self#on_list self#on_fun_param env this.m_params;
      self#on_block env this.m_body;
      begin
        self#on_list self#on_user_attribute env
          this.m_user_attributes
      end;
      self#on_option self#on_hint env this.m_ret;
      self#on_bool env this.m_ret_by_ref;
      self#on_fun_kind env this.m_fun_kind;
      self#on_Pos_t env this.m_span;
    method on_typeconst env this =
      self#on_bool env this.tconst_abstract;
      self#on_id env this.tconst_name;

        self#on_option self#on_hint env this.tconst_constraint      ;
      self#on_option self#on_hint env this.tconst_type;
      self#on_Pos_t env this.tconst_span;
    method on_is_reference env = self#on_bool env
    method on_is_variadic env = self#on_bool env
    method on_fun_param env this =
      self#on_option self#on_hint env this.param_hint;
      self#on_is_reference env this.param_is_reference;
      self#on_is_variadic env this.param_is_variadic;
      self#on_id env this.param_id;
      self#on_option self#on_expr env this.param_expr;
      self#on_option self#on_kind env this.param_modifier;

      self#on_option self#on_param_kind env this.param_callconv;
      begin
        self#on_list self#on_user_attribute env
          this.param_user_attributes
      end;
    method on_fun_ env this =
      self#on_FileInfo_mode env this.f_mode;
      self#on_list self#on_tparam env this.f_tparams;
      self#on_option self#on_hint env this.f_ret;
      self#on_bool env this.f_ret_by_ref;
      self#on_id env this.f_name;
      self#on_list self#on_fun_param env this.f_params;
      self#on_block env this.f_body;
      begin
        self#on_list self#on_user_attribute env
          this.f_user_attributes
      end;
      self#on_fun_kind env this.f_fun_kind;
      self#on_Namespace_env env this.f_namespace;
      self#on_Pos_t env this.f_span;
    method on_FSync env = ()
    method on_FAsync env = ()
    method on_FGenerator env = ()
    method on_FAsyncGenerator env = ()
    method on_FCoroutine env = ()
    method on_fun_kind env = function
      | FSync -> self#on_FSync env
      | FAsync -> self#on_FAsync env
      | FGenerator -> self#on_FGenerator env
      | FAsyncGenerator -> self#on_FAsyncGenerator env
      | FCoroutine -> self#on_FCoroutine env
    method on_hint env (c0, c1) =
      self#on_Pos_t env c0;
      self#on_hint_ env c1;
    method on_Hoption = self#on_hint
    method on_Hfun env c0 c1 c2 c3 =
      self#on_bool env c0;
      self#on_list self#on_hint env c1;
      self#on_bool env c2;
      self#on_hint env c3;
    method on_Htuple = self#on_list self#on_hint
    method on_Happly env c0 c1 =
      self#on_id env c0;
      self#on_list self#on_hint env c1;
    method on_Hshape env c0 =
      self#on_bool env c0.si_allows_unknown_fields;
      self#on_list self#on_shape_field env c0.si_shape_field_list
    method on_Haccess env c0 c1 c2 =
      self#on_id env c0;
      self#on_id env c1;
      self#on_list self#on_id env c2;
    method on_Hsoft = self#on_hint
    method on_hint_ env = function
      | Hoption c0 -> self#on_Hoption env c0
      | Hfun (c0, c1, c2, c3) -> self#on_Hfun env c0 c1 c2 c3
      | Htuple c0 -> self#on_Htuple env c0
      | Happly (c0, c1) -> self#on_Happly env c0 c1
      | Hshape c0 -> self#on_Hshape env c0
      | Haccess (c0, c1, c2) -> self#on_Haccess env c0 c1 c2
      | Hsoft c0 -> self#on_Hsoft env c0
    method on_SFlit = self#on_pstring
    method on_SFclass_const env c0 c1 =
      self#on_id env c0;
      self#on_pstring env c1;
    method on_shape_field_name env = function
      | SFlit c0 -> self#on_SFlit env c0
      | SFclass_const (c0, c1) -> self#on_SFclass_const env c0 c1
    method on_shape_field env this =
      self#on_bool env this.sf_optional;
      self#on_shape_field_name env this.sf_name;
      self#on_hint env this.sf_hint;
    method on_Unsafe env = ()
    method on_Fallthrough env = ()
    method on_Expr = self#on_expr
    method on_Omitted env = ()
    method on_Block = self#on_block
    method on_Break env pos level_opt =
      self#on_Pos_t env pos;
      self#on_option self#on_expr env level_opt
    method on_Continue env pos level_opt =
      self#on_Pos_t env pos;
      self#on_option self#on_expr env level_opt
    method on_Throw = self#on_expr
    method on_Return env c0 c1 =
      self#on_Pos_t env c0;
      self#on_option self#on_expr env c1;
    method on_Static_var = self#on_list self#on_expr
    method on_Global_var = self#on_list self#on_expr
    method on_If env c0 c1 c2 =
      self#on_expr env c0;
      self#on_block env c1;
      self#on_block env c2;
    method on_Do env c0 c1 =
      self#on_block env c0;
      self#on_expr env c1;
    method on_While env c0 c1 =
      self#on_expr env c0;
      self#on_block env c1;
    method on_For env c0 c1 c2 c3 =
      self#on_expr env c0;
      self#on_expr env c1;
      self#on_expr env c2;
      self#on_block env c3;
    method on_Switch env c0 c1 =
      self#on_expr env c0;
      self#on_list self#on_case env c1;
    method on_Foreach env c0 c1 c2 c3 =
      self#on_expr env c0;
      self#on_option self#on_Pos_t env c1;
      self#on_as_expr env c2;
      self#on_block env c3;
    method on_Try env c0 c1 c2 =
      self#on_block env c0;
      self#on_list self#on_catch env c1;
      self#on_block env c2;
    method on_Def_inline = self#on_def
    method on_Noop env = ()
    method on_stmt env = function
      | Unsafe -> self#on_Unsafe env
      | Fallthrough -> self#on_Fallthrough env
      | Expr c0 -> self#on_Expr env c0
      | Block c0 -> self#on_Block env c0
      | Break (c0, level_opt) -> self#on_Break env c0 level_opt
      | Continue (c0, level_opt) -> self#on_Continue env c0 level_opt
      | Throw c0 -> self#on_Throw env c0
      | Return (c0, c1) -> self#on_Return env c0 c1
      | GotoLabel c0 -> self#on_GotoLabel env c0
      | Goto c0 -> self#on_Goto env c0
      | Markup (c0, c1) -> self#on_Markup env c0 c1
      | Static_var c0 -> self#on_Static_var env c0
      | Global_var c0 -> self#on_Global_var env c0
      | If (c0, c1, c2) -> self#on_If env c0 c1 c2
      | Do (c0, c1) -> self#on_Do env c0 c1
      | While (c0, c1) -> self#on_While env c0 c1
      | For (c0, c1, c2, c3) -> self#on_For env c0 c1 c2 c3
      | Switch (c0, c1) -> self#on_Switch env c0 c1
      | Foreach (c0, c1, c2, c3) -> self#on_Foreach env c0 c1 c2 c3
      | Try (c0, c1, c2) -> self#on_Try env c0 c1 c2
      | Def_inline c0 ->
        self#on_Def_inline env c0
      | Noop -> self#on_Noop env
      | Using (c0, c1, c2) -> self#on_Using env c0 c1 c2
    method on_As_v = self#on_expr
    method on_As_kv env c0 c1 =
      self#on_expr env c0;
      self#on_expr env c1;
    method on_as_expr env = function
      | As_v c0 -> self#on_As_v env c0
      | As_kv (c0, c1) -> self#on_As_kv env c0 c1
    method on_block env = self#on_list self#on_stmt env
    method on_expr env (c0, c1) =
      self#on_Pos_t env c0;
      self#on_expr_ env c1;
    method on_Array = self#on_list self#on_afield
    method on_Darray env c0 =
      begin
        self#on_list
          (fun env (c0, c1) ->
               self#on_expr env c0;
               self#on_expr env c1; ()) env c0
      end;
    method on_Varray = self#on_list self#on_expr
    method on_Shape env c0 =
      begin
        self#on_list
          (fun env (c0, c1) ->
               self#on_shape_field_name env c0;
               self#on_expr env c1; ()) env c0
      end;
    method on_Collection env c0 c1 =
      self#on_id env c0;
      self#on_list self#on_afield env c1;
    method on_Null env = ()
    method on_True env = ()
    method on_False env = ()
    method on_Id = self#on_id
    method on_Id_type_arguments env c0 c1 =
      self#on_id env c0;
      self#on_list self#on_hint env c1;
    method on_Lvar = self#on_id
    method on_Lvarvar env c0 c1 =
      self#on_int env c0;
      self#on_id env c1;
    method on_Clone = self#on_expr
    method on_Obj_get env c0 c1 c2 =
      self#on_expr env c0;
      self#on_expr env c1;
      self#on_og_null_flavor env c2;
    method on_Array_get env c0 c1 =
      self#on_expr env c0;
      self#on_option self#on_expr env c1;
    method on_Class_get env c0 c1 =
      self#on_id env c0;
      self#on_expr env c1;
    method on_Class_const env c0 c1 =
      self#on_id env c0;
      self#on_pstring env c1;
    method on_Call env c0 c1 c2 c3 =
      self#on_expr env c0;
      self#on_list self#on_hint env c1;
      self#on_list self#on_expr env c2;
      self#on_list self#on_expr env c3;
    method on_Int = self#on_pstring
    method on_Float = self#on_pstring
    method on_String = self#on_pstring
    method on_String2 = self#on_list self#on_expr
    method on_Yield = self#on_afield
    method on_Yield_from = self#on_expr
    method on_Yield_break env = ()
    method on_Await = self#on_expr
    method on_Suspend = self#on_expr
    method on_List = self#on_list self#on_expr
    method on_Expr_list = self#on_list self#on_expr
    method on_Cast env c0 c1 =
      self#on_hint env c0;
      self#on_expr env c1;
    method on_Unop env c0 c1 =
      self#on_uop env c0;
      self#on_expr env c1;
    method on_Binop env c0 c1 c2 =
      self#on_bop env c0;
      self#on_expr env c1;
      self#on_expr env c2;
    method on_Pipe env c0 c1 =
      self#on_expr env c0;
      self#on_expr env c1;
    method on_Eif env c0 c1 c2 =
      self#on_expr env c0;
      self#on_option self#on_expr env c1;
      self#on_expr env c2;
    method on_NullCoalesce env c0 c1 =
      self#on_expr env c0;
      self#on_expr env c1;
    method on_InstanceOf env c0 c1 =
      self#on_expr env c0;
      self#on_expr env c1;
    method on_New env c0 c1 c2 =
      self#on_expr env c0;
      self#on_list self#on_expr env c1;
      self#on_list self#on_expr env c2;
    method on_Efun env c0 c1 =
      self#on_fun_ env c0;
      begin
        self#on_list
          (fun env (c0, c1) ->
               self#on_id env c0;
               self#on_bool env c1; ()) env c1
      end;
    method on_Lfun = self#on_fun_
    method on_Xml env c0 c1 c2 =
      self#on_id env c0;
      begin
        self#on_list
          (fun env (c0, c1) ->
               self#on_id env c0;
               self#on_expr env c1; ()) env c1
      end;
      self#on_list self#on_expr env c2;
    method on_Unsafeexpr = self#on_expr
    method on_Import env c0 c1 =
      self#on_import_flavor env c0;
      self#on_expr env c1;
    method on_GotoLabel = self#on_pstring
    method on_BracedExpr = self#on_expr
    method on_Goto = self#on_pstring
    method on_Markup env c0 c1 =
      self#on_pstring env c0;
      self#on_option self#on_expr env c1;
    method on_Using env _c0 c1 c2 =
      self#on_expr env c1;
      self#on_block env c2;
    method on_Callconv env c0 c1 =
      self#on_param_kind env c0;
      self#on_expr env c1;
    method on_expr_ env = function
      | Array c0 -> self#on_Array env c0
      | Darray c0 -> self#on_Darray env c0
      | Varray c0 -> self#on_Varray env c0
      | Shape c0 -> self#on_Shape env c0
      | Collection (c0, c1) -> self#on_Collection env c0 c1
      | Null -> self#on_Null env
      | True -> self#on_True env
      | False -> self#on_False env
      | Id c0 -> self#on_Id env c0
      | Id_type_arguments (c0, c1) -> self#on_Id_type_arguments env c0 c1
      | Lvar c0 -> self#on_Lvar env c0
      | Lvarvar (c0, c1) -> self#on_Lvarvar env c0 c1
      | Clone c0 -> self#on_Clone env c0
      | Obj_get (c0, c1, c2) -> self#on_Obj_get env c0 c1 c2
      | Array_get (c0, c1) -> self#on_Array_get env c0 c1
      | Class_get (c0, c1) -> self#on_Class_get env c0 c1
      | Class_const (c0, c1) -> self#on_Class_const env c0 c1
      | Call (c0, c1, c2, c3) -> self#on_Call env c0 c1 c2 c3
      | Int c0 -> self#on_Int env c0
      | Float c0 -> self#on_Float env c0
      | String c0 -> self#on_String env c0
      | String2 c0 -> self#on_String2 env c0
      | Yield c0 -> self#on_Yield env c0
      | Yield_from c0 -> self#on_Yield_from env c0
      | Yield_break -> self#on_Yield_break env
      | Await c0 -> self#on_Await env c0
      | Suspend c0 -> self#on_Suspend env c0
      | List c0 -> self#on_List env c0
      | Expr_list c0 -> self#on_Expr_list env c0
      | Cast (c0, c1) -> self#on_Cast env c0 c1
      | Unop (c0, c1) -> self#on_Unop env c0 c1
      | Binop (c0, c1, c2) -> self#on_Binop env c0 c1 c2
      | Pipe (c0, c1) -> self#on_Pipe env c0 c1
      | Eif (c0, c1, c2) -> self#on_Eif env c0 c1 c2
      | NullCoalesce (c0, c1) -> self#on_NullCoalesce env c0 c1
      | InstanceOf (c0, c1) -> self#on_InstanceOf env c0 c1
      | BracedExpr c0 -> self#on_BracedExpr env c0
      | New (c0, c1, c2) -> self#on_New env c0 c1 c2
      | Efun (c0, c1) -> self#on_Efun env c0 c1
      | Lfun c0 -> self#on_Lfun env c0
      | Xml (c0, c1, c2) -> self#on_Xml env c0 c1 c2
      | Unsafeexpr c0 -> self#on_Unsafeexpr env c0
      | Import (c0, c1) -> self#on_Import env c0 c1
      | Omitted         -> self#on_Omitted env
      | Callconv (c0, c1) -> self#on_Callconv env c0 c1
    method on_Include env = ()
    method on_Require env = ()
    method on_IncludeOnce env = ()
    method on_RequireOnce env = ()
    method on_import_flavor env = function
      | Include -> self#on_Include env
      | Require -> self#on_Require env
      | IncludeOnce -> self#on_IncludeOnce env
      | RequireOnce -> self#on_RequireOnce env
    method on_AFvalue = self#on_expr
    method on_AFkvalue env c0 c1 =
      self#on_expr env c0;
      self#on_expr env c1;
    method on_afield env = function
      | AFvalue c0 -> self#on_AFvalue env c0
      | AFkvalue (c0, c1) -> self#on_AFkvalue env c0 c1
    method on_Plus env = ()
    method on_Minus env = ()
    method on_Star env = ()
    method on_Slash env = ()
    method on_Eqeq env = ()
    method on_EQeqeq env = ()
    method on_Starstar env = ()
    method on_Diff env = ()
    method on_Diff2 env = ()
    method on_AMpamp env = ()
    method on_BArbar env = ()
    method on_Lt env = ()
    method on_Lte env = ()
    method on_Cmp env = ()
    method on_Gt env = ()
    method on_Gte env = ()
    method on_Dot env = ()
    method on_Amp env = ()
    method on_Bar env = ()
    method on_Ltlt env = ()
    method on_Gtgt env = ()
    method on_Percent env = ()
    method on_LogXor env = ()
    method on_Xor env = ()
    method on_Eq = self#on_option self#on_bop
    method on_bop env = function
      | Plus -> self#on_Plus env
      | Minus -> self#on_Minus env
      | Star -> self#on_Star env
      | Slash -> self#on_Slash env
      | Eqeq -> self#on_Eqeq env
      | EQeqeq -> self#on_EQeqeq env
      | Starstar -> self#on_Starstar env
      | Diff -> self#on_Diff env
      | Diff2 -> self#on_Diff2 env
      | AMpamp -> self#on_AMpamp env
      | BArbar -> self#on_BArbar env
      | Lt -> self#on_Lt env
      | Lte -> self#on_Lte env
      | Gt -> self#on_Gt env
      | Gte -> self#on_Gte env
      | Dot -> self#on_Dot env
      | Amp -> self#on_Amp env
      | Bar -> self#on_Bar env
      | Ltlt -> self#on_Ltlt env
      | Gtgt -> self#on_Gtgt env
      | Cmp -> self#on_Cmp env
      | Percent -> self#on_Percent env
      | LogXor -> self#on_LogXor env
      | Xor -> self#on_Xor env
      | Eq c0 -> self#on_Eq env c0
    method on_Utild env = ()
    method on_Unot env = ()
    method on_Uplus env = ()
    method on_Uminus env = ()
    method on_Uincr env = ()
    method on_Udecr env = ()
    method on_Upincr env = ()
    method on_Updecr env = ()
    method on_Uref env = ()
    method on_Usilence env = ()
    method on_uop env = function
      | Utild -> self#on_Utild env
      | Unot -> self#on_Unot env
      | Uplus -> self#on_Uplus env
      | Uminus -> self#on_Uminus env
      | Uincr -> self#on_Uincr env
      | Udecr -> self#on_Udecr env
      | Upincr -> self#on_Upincr env
      | Updecr -> self#on_Updecr env
      | Uref -> self#on_Uref env
      | Usilence -> self#on_Usilence env
    method on_Default = self#on_block
    method on_Case env c0 c1 =
      self#on_expr env c0;
      self#on_block env c1;
    method on_case env = function
      | Default c0 -> self#on_Default env c0
      | Case (c0, c1) -> self#on_Case env c0 c1
    method on_catch env (c0, c1, c2) =
      self#on_id env c0;
      self#on_id env c1;
      self#on_block env c2;
    method on_field env (c0, c1) =
      self#on_expr env c0;
      self#on_expr env c1;
    method on_attr env (c0, c1) =
      self#on_id env c0;
      self#on_expr env c1;
    method on_AHint = self#on_hint
    method on_AExpr = self#on_expr
    method on_AStmt = self#on_stmt
    method on_ADef = self#on_def
    method on_AProgram = self#on_program
    method on_any env = function
      | AHint c0 -> self#on_AHint env c0
      | AExpr c0 -> self#on_AExpr env c0
      | AStmt c0 -> self#on_AStmt env c0
      | ADef c0 -> self#on_ADef env c0
      | AProgram c0 -> self#on_AProgram env c0
  end
