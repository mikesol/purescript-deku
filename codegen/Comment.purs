module Comment where

import Prelude

import PureScript.CST.Types (Comment(..), Declaration(..), Expr(..), Labeled(..), LineFeed(..), Module(..), ModuleHeader(..), Name(..), SourceToken)

commentModule :: forall e . Array String -> Module e -> Module e
commentModule txt ( Module mod@{ header : ModuleHeader header } ) =
    Module mod { header = ModuleHeader header { keyword = commentToken comment header.keyword } }
    
    where

    comment = mkBlockComment txt

inlineComment :: forall e . String -> Expr e -> Expr e
inlineComment txt = case _ of
    ExprString tok v ->
        ExprString ( commentToken comment tok ) v

    id ->
        id

    where
    
    comment = mkInlineComment txt

commentDecl :: forall e . Array String -> Declaration e -> Declaration e
commentDecl txt = case _ of
    DeclData head vs ->
        DeclData head { keyword = commentToken comment head.keyword } vs

    DeclSignature ( Labeled labeled ) ->
        DeclSignature $ Labeled labeled { label = commentName comment labeled.label }

    id ->
        id

    where

    comment = mkBlockComment txt

commentName :: forall a . Array ( Comment LineFeed ) -> Name a -> Name a
commentName cs ( Name name ) = Name name { token = commentToken cs name.token }

commentToken :: Array ( Comment LineFeed ) -> SourceToken -> SourceToken
commentToken comments tok@{ leadingComments } =
    tok { leadingComments = leadingComments <> comments }

mkBlockComment :: Array String -> Array ( Comment LineFeed ) 
mkBlockComment ls =
    bind ls \l -> [ Comment $ "-- | " <> l, Line LF 1 ]

mkInlineComment :: forall l . String -> Array ( Comment l )
mkInlineComment =
    pure <<< Comment <<< flip append " -}" <<< append "{- "