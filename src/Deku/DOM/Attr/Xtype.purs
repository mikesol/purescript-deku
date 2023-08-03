module Deku.DOM.Attr.Xtype where

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
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data Xtype = Xtype

instance Attr Button_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Button_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Button_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Button_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Button_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Input_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Input_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Input_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Input_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Input_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Embed_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Embed_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Embed_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Embed_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Embed_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Object_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Object_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Object_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Object_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Object_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Script_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Script_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Script_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Script_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Script_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Source_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Source_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Source_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Source_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Source_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Style_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Style_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Style_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Style_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Style_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Link_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Link_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr Link_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr Link_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr Link_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr AnimateTransform_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr AnimateTransform_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr AnimateTransform_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr AnimateTransform_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr AnimateTransform_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeColorMatrix_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeColorMatrix_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeColorMatrix_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeColorMatrix_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeColorMatrix_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncA_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncA_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncA_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncA_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncA_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncB_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncB_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncB_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncB_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncB_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncG_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncG_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncG_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncG_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncG_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncR_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncR_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncR_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncR_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeFuncR_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeTurbulence_ Xtype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure 
    { key: "type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeTurbulence_ Xtype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeTurbulence_ Xtype  String  where
  attr Xtype value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeTurbulence_ Xtype (Event.Event  String ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr FeTurbulence_ Xtype (ST.ST Global.Global  String ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "type", value: prop' value }

instance Attr everything Xtype (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Xtype bothValues = unsafeAttribute $ Both (pure  { key: "type", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "type", value: unset' })
instance Attr everything Xtype (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Xtype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "type", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "type", value: unset' })
instance Attr everything Xtype  Unit  where
  attr Xtype _ = unsafeAttribute $ This $ pure $ { key: "type", value: unset' }
instance Attr everything Xtype (Event.Event  Unit ) where
  attr Xtype eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "type", value: unset' }

instance Attr everything Xtype (ST.ST Global.Global  Unit ) where
  attr Xtype stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "type", value: unset' }
