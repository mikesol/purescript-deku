module Deku.DOM.Attr.XlinkArcrole where

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

data XlinkArcrole = XlinkArcrole

instance Attr AnimateTransform_ XlinkArcrole (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:arcrole", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr AnimateTransform_ XlinkArcrole (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkArcrole (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:arcrole", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr AnimateTransform_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ This $ pure $
    { key: "xlink:arcrole", value: prop' value }
instance Attr AnimateTransform_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr AnimateTransform_ XlinkArcrole (ST.ST Global.Global  String ) where
  attr XlinkArcrole iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr FeImage_ XlinkArcrole (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:arcrole", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr FeImage_ XlinkArcrole (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkArcrole (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:arcrole", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr FeImage_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ This $ pure $
    { key: "xlink:arcrole", value: prop' value }
instance Attr FeImage_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr FeImage_ XlinkArcrole (ST.ST Global.Global  String ) where
  attr XlinkArcrole iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Filter_ XlinkArcrole (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:arcrole", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr Filter_ XlinkArcrole (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkArcrole (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:arcrole", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr Filter_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ This $ pure $
    { key: "xlink:arcrole", value: prop' value }
instance Attr Filter_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Filter_ XlinkArcrole (ST.ST Global.Global  String ) where
  attr XlinkArcrole iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Image_ XlinkArcrole (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:arcrole", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr Image_ XlinkArcrole (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkArcrole (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:arcrole", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr Image_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ This $ pure $
    { key: "xlink:arcrole", value: prop' value }
instance Attr Image_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Image_ XlinkArcrole (ST.ST Global.Global  String ) where
  attr XlinkArcrole iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Mpath_ XlinkArcrole (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:arcrole", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr Mpath_ XlinkArcrole (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkArcrole (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:arcrole", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
instance Attr Mpath_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ This $ pure $
    { key: "xlink:arcrole", value: prop' value }
instance Attr Mpath_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Mpath_ XlinkArcrole (ST.ST Global.Global  String ) where
  attr XlinkArcrole iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr everything XlinkArcrole (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:arcrole", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xlink:arcrole", value: unset' })
instance Attr everything XlinkArcrole (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XlinkArcrole (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "xlink:arcrole", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xlink:arcrole", value: unset' })
instance Attr everything XlinkArcrole  Unit  where
  attr XlinkArcrole _ = unsafeAttribute $ This $ pure $
    { key: "xlink:arcrole", value: unset' }
instance Attr everything XlinkArcrole (Event.Event  Unit ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:arcrole", value: unset' }

instance Attr everything XlinkArcrole (ST.ST Global.Global  Unit ) where
  attr XlinkArcrole iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "xlink:arcrole", value: unset' }
