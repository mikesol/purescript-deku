module Deku.DOM.Attr.XlinkShow where

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

data XlinkShow = XlinkShow

instance Attr AnimateTransform_ XlinkShow (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkShow bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:show", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr AnimateTransform_ XlinkShow (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:show", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr AnimateTransform_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute $ This $ pure $
    { key: "xlink:show", value: prop' value }
instance Attr AnimateTransform_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr AnimateTransform_ XlinkShow (ST.ST Global.Global  String ) where
  attr XlinkShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr FeImage_ XlinkShow (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkShow bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:show", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr FeImage_ XlinkShow (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:show", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr FeImage_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute $ This $ pure $
    { key: "xlink:show", value: prop' value }
instance Attr FeImage_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr FeImage_ XlinkShow (ST.ST Global.Global  String ) where
  attr XlinkShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr Filter_ XlinkShow (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkShow bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:show", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr Filter_ XlinkShow (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:show", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr Filter_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute $ This $ pure $
    { key: "xlink:show", value: prop' value }
instance Attr Filter_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr Filter_ XlinkShow (ST.ST Global.Global  String ) where
  attr XlinkShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr Image_ XlinkShow (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkShow bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:show", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr Image_ XlinkShow (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:show", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr Image_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute $ This $ pure $
    { key: "xlink:show", value: prop' value }
instance Attr Image_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr Image_ XlinkShow (ST.ST Global.Global  String ) where
  attr XlinkShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr Mpath_ XlinkShow (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkShow bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:show", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr Mpath_ XlinkShow (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xlink:show", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:show", value: prop' value })
instance Attr Mpath_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute $ This $ pure $
    { key: "xlink:show", value: prop' value }
instance Attr Mpath_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr Mpath_ XlinkShow (ST.ST Global.Global  String ) where
  attr XlinkShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "xlink:show", value: prop' value }

instance Attr everything XlinkShow (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XlinkShow bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:show", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xlink:show", value: unset' })
instance Attr everything XlinkShow (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XlinkShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "xlink:show", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xlink:show", value: unset' })
instance Attr everything XlinkShow  Unit  where
  attr XlinkShow _ = unsafeAttribute $ This $ pure $
    { key: "xlink:show", value: unset' }
instance Attr everything XlinkShow (Event.Event  Unit ) where
  attr XlinkShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:show", value: unset' }

instance Attr everything XlinkShow (ST.ST Global.Global  Unit ) where
  attr XlinkShow stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "xlink:show", value: unset' }
