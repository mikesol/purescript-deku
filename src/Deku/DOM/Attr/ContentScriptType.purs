module Deku.DOM.Attr.ContentScriptType where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentScriptType = ContentScriptType

instance Attr Svg_ ContentScriptType (NonEmpty.NonEmpty Event.Event  String ) where
  attr ContentScriptType bothValues = unsafeAttribute $ Both (pure 
    { key: "contentScriptType", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contentScriptType", value: prop' value }
    )
instance Attr Svg_ ContentScriptType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ContentScriptType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "contentScriptType", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contentScriptType", value: prop' value }
    )
instance Attr Svg_ ContentScriptType  String  where
  attr ContentScriptType value = unsafeAttribute $ This $ pure $
    { key: "contentScriptType", value: prop' value }
instance Attr Svg_ ContentScriptType (Event.Event  String ) where
  attr ContentScriptType eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contentScriptType", value: prop' value }

instance Attr Svg_ ContentScriptType (ST.ST Global.Global  String ) where
  attr ContentScriptType iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "contentScriptType", value: prop' value }

instance Attr everything ContentScriptType (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ContentScriptType bothValues = unsafeAttribute $ Both (pure 
    { key: "contentScriptType", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "contentScriptType", value: unset' })
instance Attr everything ContentScriptType (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr ContentScriptType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "contentScriptType", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "contentScriptType", value: unset' })
instance Attr everything ContentScriptType  Unit  where
  attr ContentScriptType _ = unsafeAttribute $ This $ pure $
    { key: "contentScriptType", value: unset' }
instance Attr everything ContentScriptType (Event.Event  Unit ) where
  attr ContentScriptType eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "contentScriptType", value: unset' }

instance Attr everything ContentScriptType (ST.ST Global.Global  Unit ) where
  attr ContentScriptType iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "contentScriptType", value: unset' }
