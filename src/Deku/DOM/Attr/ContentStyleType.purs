module Deku.DOM.Attr.ContentStyleType where

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

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType (NonEmpty.NonEmpty Event.Event  String ) where
  attr ContentStyleType bothValues = unsafeAttribute $ Both (pure 
    { key: "contentStyleType", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contentStyleType", value: prop' value }
    )
instance Attr Svg_ ContentStyleType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ContentStyleType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contentStyleType", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contentStyleType", value: prop' value }
    )
instance Attr Svg_ ContentStyleType  String  where
  attr ContentStyleType value = unsafeAttribute $ This $ pure $
    { key: "contentStyleType", value: prop' value }
instance Attr Svg_ ContentStyleType (Event.Event  String ) where
  attr ContentStyleType eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contentStyleType", value: prop' value }

instance Attr Svg_ ContentStyleType (ST.ST Global.Global  String ) where
  attr ContentStyleType stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contentStyleType", value: prop' value }

instance Attr everything ContentStyleType (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ContentStyleType bothValues = unsafeAttribute $ Both (pure 
    { key: "contentStyleType", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "contentStyleType", value: unset' })
instance Attr everything ContentStyleType (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr ContentStyleType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "contentStyleType", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "contentStyleType", value: unset' })
instance Attr everything ContentStyleType  Unit  where
  attr ContentStyleType _ = unsafeAttribute $ This $ pure $
    { key: "contentStyleType", value: unset' }
instance Attr everything ContentStyleType (Event.Event  Unit ) where
  attr ContentStyleType eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "contentStyleType", value: unset' }

instance Attr everything ContentStyleType (ST.ST Global.Global  Unit ) where
  attr ContentStyleType stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "contentStyleType", value: unset' }
