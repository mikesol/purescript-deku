module Deku.DOM.Attr.Autocomplete where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autocomplete = Autocomplete

instance Attr Form_ Autocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "autocomplete", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Form_ Autocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocomplete", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Form_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ This $ pure $
    { key: "autocomplete", value: prop' value }
instance Attr Form_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Form_ Autocomplete (ST.ST Global.Global  String ) where
  attr Autocomplete stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Input_ Autocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "autocomplete", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Input_ Autocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocomplete", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Input_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ This $ pure $
    { key: "autocomplete", value: prop' value }
instance Attr Input_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Input_ Autocomplete (ST.ST Global.Global  String ) where
  attr Autocomplete stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Select_ Autocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "autocomplete", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Select_ Autocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocomplete", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Select_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ This $ pure $
    { key: "autocomplete", value: prop' value }
instance Attr Select_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Select_ Autocomplete (ST.ST Global.Global  String ) where
  attr Autocomplete stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Textarea_ Autocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "autocomplete", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Textarea_ Autocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocomplete", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
instance Attr Textarea_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ This $ pure $
    { key: "autocomplete", value: prop' value }
instance Attr Textarea_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Textarea_ Autocomplete (ST.ST Global.Global  String ) where
  attr Autocomplete stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr everything Autocomplete (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Autocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "autocomplete", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "autocomplete", value: unset' })
instance Attr everything Autocomplete (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Autocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "autocomplete", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "autocomplete", value: unset' })
instance Attr everything Autocomplete  Unit  where
  attr Autocomplete _ = unsafeAttribute $ This $ pure $
    { key: "autocomplete", value: unset' }
instance Attr everything Autocomplete (Event.Event  Unit ) where
  attr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "autocomplete", value: unset' }

instance Attr everything Autocomplete (ST.ST Global.Global  Unit ) where
  attr Autocomplete stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "autocomplete", value: unset' }
