module Deku.DOM.Attr.Name where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Map (Map_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Param (Param_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Name = Name

instance Attr Button_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Button_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Button_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Button_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Button_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Form_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Form_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Form_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Form_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Form_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Fieldset_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Fieldset_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Fieldset_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Fieldset_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Fieldset_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Iframe_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Iframe_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Iframe_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Iframe_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Iframe_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Input_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Input_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Input_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Input_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Input_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Object_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Object_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Object_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Object_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Object_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Output_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Output_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Output_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Output_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Output_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Select_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Select_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Select_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Select_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Select_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Textarea_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Textarea_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Textarea_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Textarea_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Textarea_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Map_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Map_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Map_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Map_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Map_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Meta_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Meta_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Meta_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Meta_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Meta_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Param_ Name (NonEmpty.NonEmpty Event.Event  String ) where
  attr Name bothValues = unsafeAttribute $ Both (pure 
    { key: "name", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Param_ Name (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "name", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "name", value: prop' value })
instance Attr Param_ Name  String  where
  attr Name value = unsafeAttribute $ This $ pure $
    { key: "name", value: prop' value }
instance Attr Param_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Param_ Name (ST.ST Global.Global  String ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr everything Name (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Name bothValues = unsafeAttribute $ Both (pure  { key: "name", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "name", value: unset' })
instance Attr everything Name (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Name (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "name", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "name", value: unset' })
instance Attr everything Name  Unit  where
  attr Name _ = unsafeAttribute $ This $ pure $ { key: "name", value: unset' }
instance Attr everything Name (Event.Event  Unit ) where
  attr Name eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "name", value: unset' }

instance Attr everything Name (ST.ST Global.Global  Unit ) where
  attr Name stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "name", value: unset' }
