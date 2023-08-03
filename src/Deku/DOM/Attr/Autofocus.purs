module Deku.DOM.Attr.Autofocus where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autofocus = Autofocus

instance Attr Button_ Autofocus (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autofocus bothValues = unsafeAttribute $ Both (pure 
    { key: "autofocus", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Button_ Autofocus (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autofocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autofocus", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Button_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ This $ pure $
    { key: "autofocus", value: prop' value }
instance Attr Button_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr Button_ Autofocus (ST.ST Global.Global  String ) where
  attr Autofocus stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr Input_ Autofocus (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autofocus bothValues = unsafeAttribute $ Both (pure 
    { key: "autofocus", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Input_ Autofocus (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autofocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autofocus", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Input_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ This $ pure $
    { key: "autofocus", value: prop' value }
instance Attr Input_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr Input_ Autofocus (ST.ST Global.Global  String ) where
  attr Autofocus stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr Select_ Autofocus (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autofocus bothValues = unsafeAttribute $ Both (pure 
    { key: "autofocus", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Select_ Autofocus (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autofocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autofocus", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Select_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ This $ pure $
    { key: "autofocus", value: prop' value }
instance Attr Select_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr Select_ Autofocus (ST.ST Global.Global  String ) where
  attr Autofocus stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr Textarea_ Autofocus (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autofocus bothValues = unsafeAttribute $ Both (pure 
    { key: "autofocus", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Textarea_ Autofocus (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autofocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autofocus", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autofocus", value: prop' value })
instance Attr Textarea_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ This $ pure $
    { key: "autofocus", value: prop' value }
instance Attr Textarea_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr Textarea_ Autofocus (ST.ST Global.Global  String ) where
  attr Autofocus stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autofocus", value: prop' value }

instance Attr everything Autofocus (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Autofocus bothValues = unsafeAttribute $ Both (pure 
    { key: "autofocus", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "autofocus", value: unset' })
instance Attr everything Autofocus (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Autofocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "autofocus", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "autofocus", value: unset' })
instance Attr everything Autofocus  Unit  where
  attr Autofocus _ = unsafeAttribute $ This $ pure $
    { key: "autofocus", value: unset' }
instance Attr everything Autofocus (Event.Event  Unit ) where
  attr Autofocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "autofocus", value: unset' }

instance Attr everything Autofocus (ST.ST Global.Global  Unit ) where
  attr Autofocus stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "autofocus", value: unset' }
