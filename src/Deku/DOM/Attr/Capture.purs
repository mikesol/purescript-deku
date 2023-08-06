module Deku.DOM.Attr.Capture where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Capture = Capture

instance Attr Input_ Capture (NonEmpty.NonEmpty Event.Event  String ) where
  attr Capture bothValues = unsafeAttribute $ Both (pure 
    { key: "capture", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "capture", value: prop' value })
instance Attr Input_ Capture (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Capture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "capture", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "capture", value: prop' value })
instance Attr Input_ Capture  String  where
  attr Capture value = unsafeAttribute $ This $ pure $
    { key: "capture", value: prop' value }
instance Attr Input_ Capture (Event.Event  String ) where
  attr Capture eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "capture", value: prop' value }

instance Attr Input_ Capture (ST.ST Global.Global  String ) where
  attr Capture iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "capture", value: prop' value }

instance Attr everything Capture (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Capture bothValues = unsafeAttribute $ Both (pure 
    { key: "capture", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "capture", value: unset' })
instance Attr everything Capture (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Capture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "capture", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "capture", value: unset' })
instance Attr everything Capture  Unit  where
  attr Capture _ = unsafeAttribute $ This $ { key: "capture", value: unset' }
instance Attr everything Capture (Event.Event  Unit ) where
  attr Capture eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "capture", value: unset' }

instance Attr everything Capture (ST.ST Global.Global  Unit ) where
  attr Capture iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "capture", value: unset' }
