module Deku.DOM.Attr.KeyPoints where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyPoints = KeyPoints

instance Attr AnimateMotion_ KeyPoints (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyPoints bothValues = unsafeAttribute $ Both (pure 
    { key: "keyPoints", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keyPoints", value: prop' value })
instance Attr AnimateMotion_ KeyPoints (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KeyPoints (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keyPoints", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keyPoints", value: prop' value })
instance Attr AnimateMotion_ KeyPoints  String  where
  attr KeyPoints value = unsafeAttribute $ This $ pure $
    { key: "keyPoints", value: prop' value }
instance Attr AnimateMotion_ KeyPoints (Event.Event  String ) where
  attr KeyPoints eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyPoints", value: prop' value }

instance Attr AnimateMotion_ KeyPoints (ST.ST Global.Global  String ) where
  attr KeyPoints stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keyPoints", value: prop' value }

instance Attr everything KeyPoints (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KeyPoints bothValues = unsafeAttribute $ Both (pure 
    { key: "keyPoints", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keyPoints", value: unset' })
instance Attr everything KeyPoints (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr KeyPoints (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "keyPoints", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "keyPoints", value: unset' })
instance Attr everything KeyPoints  Unit  where
  attr KeyPoints _ = unsafeAttribute $ This $ pure $
    { key: "keyPoints", value: unset' }
instance Attr everything KeyPoints (Event.Event  Unit ) where
  attr KeyPoints eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keyPoints", value: unset' }

instance Attr everything KeyPoints (ST.ST Global.Global  Unit ) where
  attr KeyPoints stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "keyPoints", value: unset' }
