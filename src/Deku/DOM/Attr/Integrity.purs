module Deku.DOM.Attr.Integrity where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Integrity = Integrity

instance Attr Link_ Integrity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Integrity bothValues = unsafeAttribute $ Both (pure 
    { key: "integrity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "integrity", value: prop' value })
instance Attr Link_ Integrity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Integrity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "integrity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "integrity", value: prop' value })
instance Attr Link_ Integrity  String  where
  attr Integrity value = unsafeAttribute $ This $ pure $
    { key: "integrity", value: prop' value }
instance Attr Link_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "integrity", value: prop' value }

instance Attr Link_ Integrity (ST.ST Global.Global  String ) where
  attr Integrity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "integrity", value: prop' value }

instance Attr Script_ Integrity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Integrity bothValues = unsafeAttribute $ Both (pure 
    { key: "integrity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "integrity", value: prop' value })
instance Attr Script_ Integrity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Integrity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "integrity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "integrity", value: prop' value })
instance Attr Script_ Integrity  String  where
  attr Integrity value = unsafeAttribute $ This $ pure $
    { key: "integrity", value: prop' value }
instance Attr Script_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "integrity", value: prop' value }

instance Attr Script_ Integrity (ST.ST Global.Global  String ) where
  attr Integrity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "integrity", value: prop' value }

instance Attr everything Integrity (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Integrity bothValues = unsafeAttribute $ Both (pure 
    { key: "integrity", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "integrity", value: unset' })
instance Attr everything Integrity (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Integrity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "integrity", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "integrity", value: unset' })
instance Attr everything Integrity  Unit  where
  attr Integrity _ = unsafeAttribute $ This $ pure $
    { key: "integrity", value: unset' }
instance Attr everything Integrity (Event.Event  Unit ) where
  attr Integrity eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "integrity", value: unset' }

instance Attr everything Integrity (ST.ST Global.Global  Unit ) where
  attr Integrity iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "integrity", value: unset' }
