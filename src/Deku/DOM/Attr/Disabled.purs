module Deku.DOM.Attr.Disabled where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Disabled = Disabled

instance Attr Button_ Disabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Button_ Disabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Button_ Disabled  String  where
  attr Disabled value = unsafeAttribute $ This $ pure $
    { key: "disabled", value: prop' value }
instance Attr Button_ Disabled (Event.Event  String ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Button_ Disabled (ST.ST Global.Global  String ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Fieldset_ Disabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Fieldset_ Disabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Fieldset_ Disabled  String  where
  attr Disabled value = unsafeAttribute $ This $ pure $
    { key: "disabled", value: prop' value }
instance Attr Fieldset_ Disabled (Event.Event  String ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Fieldset_ Disabled (ST.ST Global.Global  String ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Input_ Disabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Input_ Disabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Input_ Disabled  String  where
  attr Disabled value = unsafeAttribute $ This $ pure $
    { key: "disabled", value: prop' value }
instance Attr Input_ Disabled (Event.Event  String ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Input_ Disabled (ST.ST Global.Global  String ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Optgroup_ Disabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Optgroup_ Disabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Optgroup_ Disabled  String  where
  attr Disabled value = unsafeAttribute $ This $ pure $
    { key: "disabled", value: prop' value }
instance Attr Optgroup_ Disabled (Event.Event  String ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Optgroup_ Disabled (ST.ST Global.Global  String ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Option_ Disabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Option_ Disabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Option_ Disabled  String  where
  attr Disabled value = unsafeAttribute $ This $ pure $
    { key: "disabled", value: prop' value }
instance Attr Option_ Disabled (Event.Event  String ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Option_ Disabled (ST.ST Global.Global  String ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Select_ Disabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Select_ Disabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Select_ Disabled  String  where
  attr Disabled value = unsafeAttribute $ This $ pure $
    { key: "disabled", value: prop' value }
instance Attr Select_ Disabled (Event.Event  String ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Select_ Disabled (ST.ST Global.Global  String ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Textarea_ Disabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Textarea_ Disabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "disabled", value: prop' value })
instance Attr Textarea_ Disabled  String  where
  attr Disabled value = unsafeAttribute $ This $ pure $
    { key: "disabled", value: prop' value }
instance Attr Textarea_ Disabled (Event.Event  String ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Textarea_ Disabled (ST.ST Global.Global  String ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr everything Disabled (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Disabled bothValues = unsafeAttribute $ Both (pure 
    { key: "disabled", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "disabled", value: unset' })
instance Attr everything Disabled (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Disabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "disabled", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "disabled", value: unset' })
instance Attr everything Disabled  Unit  where
  attr Disabled _ = unsafeAttribute $ This $ pure $
    { key: "disabled", value: unset' }
instance Attr everything Disabled (Event.Event  Unit ) where
  attr Disabled eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "disabled", value: unset' }

instance Attr everything Disabled (ST.ST Global.Global  Unit ) where
  attr Disabled stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "disabled", value: unset' }
