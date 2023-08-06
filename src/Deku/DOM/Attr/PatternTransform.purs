module Deku.DOM.Attr.PatternTransform where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform (NonEmpty.NonEmpty Event.Event  String ) where
  attr PatternTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "patternTransform", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "patternTransform", value: prop' value }
    )
instance Attr Pattern_ PatternTransform (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PatternTransform (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "patternTransform", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "patternTransform", value: prop' value }
    )
instance Attr Pattern_ PatternTransform  String  where
  attr PatternTransform value = unsafeAttribute $ This $ pure $
    { key: "patternTransform", value: prop' value }
instance Attr Pattern_ PatternTransform (Event.Event  String ) where
  attr PatternTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "patternTransform", value: prop' value }

instance Attr Pattern_ PatternTransform (ST.ST Global.Global  String ) where
  attr PatternTransform iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "patternTransform", value: prop' value }

instance Attr everything PatternTransform (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PatternTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "patternTransform", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "patternTransform", value: unset' })
instance Attr everything PatternTransform (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PatternTransform (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "patternTransform", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "patternTransform", value: unset' })
instance Attr everything PatternTransform  Unit  where
  attr PatternTransform _ = unsafeAttribute $ This $ pure $
    { key: "patternTransform", value: unset' }
instance Attr everything PatternTransform (Event.Event  Unit ) where
  attr PatternTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "patternTransform", value: unset' }

instance Attr everything PatternTransform (ST.ST Global.Global  Unit ) where
  attr PatternTransform iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "patternTransform", value: unset' }
