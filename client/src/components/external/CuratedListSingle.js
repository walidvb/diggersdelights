import React from 'react'
import routes from '../../routes';
import { Link } from 'react-router-dom';

const CuratedListSingle = ({image_url, title, site_name, description, url}) => {
  const destination = [routes.curatedList.show, "?url=", encodeURIComponent(url)].join('')
  return <Link to={destination} className={'no-underline'}>
    <div className="my-4 flex no-underline align-start hover:opacity-75">
      <img className={"w-64 mr-4"} src={image_url} alt={title}/>
      <div className="flex flex-col">
        <div className="text-lg pb-2">{title}</div>
        <div className="flex-grow">{description}</div>
        <div className="text-gray-600 text-sm mt-3 text-right">{site_name}</div>
      </div>

    </div>
  </Link>
}

export default CuratedListSingle