module Deku.DOM.Attr.XlinkType where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkType = XlinkType

instance Attr AnimateTransform_ XlinkType (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkType bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr AnimateTransform_ XlinkType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr AnimateTransform_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ This $ pure $
    { key: "xlink:type", value: prop' value }
instance Attr AnimateTransform_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr AnimateTransform_ XlinkType (ST.ST Global.Global  String ) where
  attr XlinkType stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr FeImage_ XlinkType (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkType bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr FeImage_ XlinkType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr FeImage_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ This $ pure $
    { key: "xlink:type", value: prop' value }
instance Attr FeImage_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr FeImage_ XlinkType (ST.ST Global.Global  String ) where
  attr XlinkType stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Filter_ XlinkType (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkType bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr Filter_ XlinkType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr Filter_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ This $ pure $
    { key: "xlink:type", value: prop' value }
instance Attr Filter_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Filter_ XlinkType (ST.ST Global.Global  String ) where
  attr XlinkType stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Image_ XlinkType (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkType bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr Image_ XlinkType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr Image_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ This $ pure $
    { key: "xlink:type", value: prop' value }
instance Attr Image_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Image_ XlinkType (ST.ST Global.Global  String ) where
  attr XlinkType stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Mpath_ XlinkType (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkType bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr Mpath_ XlinkType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:type", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:type", value: prop' value })
instance Attr Mpath_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ This $ pure $
    { key: "xlink:type", value: prop' value }
instance Attr Mpath_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Mpath_ XlinkType (ST.ST Global.Global  String ) where
  attr XlinkType stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr everything XlinkType (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XlinkType bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:type", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xlink:type", value: unset' })
instance Attr everything XlinkType (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XlinkType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "xlink:type", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xlink:type", value: unset' })
instance Attr everything XlinkType  Unit  where
  attr XlinkType _ = unsafeAttribute $ This $ pure $
    { key: "xlink:type", value: unset' }
instance Attr everything XlinkType (Event.Event  Unit ) where
  attr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:type", value: unset' }

instance Attr everything XlinkType (ST.ST Global.Global  Unit ) where
  attr XlinkType stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "xlink:type", value: unset' }
