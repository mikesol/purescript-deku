module Deku.DOM.Attr.Value where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Param (Param_)
import Deku.DOM.Elt.Progress (Progress_)

data Value = Value

instance Attr Textarea_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Textarea_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Textarea_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Textarea_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Textarea_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr Button_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Button_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Button_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Button_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Button_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr Input_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Input_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Input_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Input_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Input_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr Li_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Li_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Li_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Li_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Li_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr Meter_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Meter_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Meter_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Meter_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Meter_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr Option_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Option_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Option_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Option_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Option_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr Progress_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Progress_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Progress_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Progress_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Progress_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr Param_ Value (NonEmpty.NonEmpty Event.Event  String ) where
  attr Value bothValues = unsafeAttribute $ Both (pure 
    { key: "value", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Param_ Value (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "value", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "value", value: prop' value })
instance Attr Param_ Value  String  where
  attr Value value = unsafeAttribute $ This $ pure $
    { key: "value", value: prop' value }
instance Attr Param_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Param_ Value (ST.ST Global.Global  String ) where
  attr Value iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "value", value: prop' value }

instance Attr everything Value (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Value bothValues = unsafeAttribute $ Both (pure  { key: "value", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "value", value: unset' })
instance Attr everything Value (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Value (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "value", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "value", value: unset' })
instance Attr everything Value  Unit  where
  attr Value _ = unsafeAttribute $ This $ { key: "value", value: unset' }
instance Attr everything Value (Event.Event  Unit ) where
  attr Value eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "value", value: unset' }

instance Attr everything Value (ST.ST Global.Global  Unit ) where
  attr Value iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "value", value: unset' }
